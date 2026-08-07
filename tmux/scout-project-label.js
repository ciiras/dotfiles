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

const { spawn, execFileSync } = require('child_process')

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

  const child = spawn(process.execPath, [HOOK], { stdio: ['pipe', 'inherit', 'inherit'] })
  child.on('error', () => process.exit(0))
  child.on('exit', code => process.exit(code === null ? 0 : code))
  child.stdin.on('error', () => {})
  child.stdin.end(payload)
}

main().catch(() => process.exit(0))
