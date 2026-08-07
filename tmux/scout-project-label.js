#!/usr/bin/env node
// Rewrites the `cwd` of a Claude Code hook payload to a stable project label before
// handing it to tmux-scout's own hook, so the picker's PROJECT column reflects what a
// pane is working on rather than wherever a Bash `cd` happened to leave the session.
//
//   node scout-project-label.js <path-to-tmux-scout/scripts/hooks/claude.js>
//
// Label resolution: @scout-project (pane or window option) -> tmux window name -> cwd.
// Only worth registering for SessionStart and UserPromptSubmit — the only events where
// tmux-scout stores workingDirectory.
//
// The hook runs in this process, not a child — see the note in main().

const { execFileSync } = require('child_process')
const { Readable } = require('stream')

const HOOK = process.argv[2]

// tmux auto-names unnamed windows after the running process, which is no better a label
// than the cwd we are replacing.
const SHELLS = new Set(['zsh', 'bash', 'sh', 'fish', 'node'])

function isAutoName(name, paneCommand) {
  return name === paneCommand || /^[\d.]+$/.test(name) || SHELLS.has(name)
}

function resolveLabel() {
  const pane = process.env.TMUX_PANE
  if (!pane) return null

  const out = execFileSync(
    'tmux',
    ['display-message', '-p', '-t', pane, '#{@scout-project}\t#{window_name}\t#{pane_current_command}'],
    { encoding: 'utf-8', timeout: 2000, stdio: ['ignore', 'pipe', 'ignore'] }
  )

  const [override, windowName, paneCommand] = out.split('\n')[0].split('\t')

  const label = override && override.trim()
    ? override
    : windowName && !isAutoName(windowName, paneCommand) ? windowName : null
  if (!label) return null

  const clean = label.replace(/[\r\n\t]+/g, ' ').replace(/\//g, '-').trim()
  return clean ? clean.slice(0, 25) : null
}

async function main() {
  let input = ''
  for await (const chunk of process.stdin) input += chunk

  let payload = input
  try {
    const data = JSON.parse(input)
    const label = resolveLabel()
    if (label) {
      data.cwd = label
      payload = JSON.stringify(data)
    }
  } catch (e) {
    // Unparseable payload, no tmux, tmux errored — pass the original through untouched.
    // A bad label must never break the hook chain.
  }

  // Run the hook in *this* process rather than spawning it. tmux-scout records
  // `process.ppid` as the agent's pid and its picker hides any session whose pid is dead,
  // so a wrapper process between claude and the hook gets the session marked crashed the
  // moment the wrapper exits. Requiring keeps ppid pointing at claude itself.
  Object.defineProperty(process, 'stdin', {
    value: Readable.from([payload]),
    configurable: true
  })

  try {
    require(HOOK)
  } catch (e) {
    process.exit(0)
  }
}

main().catch(() => process.exit(0))
