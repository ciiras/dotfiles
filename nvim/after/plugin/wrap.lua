local function toggle_wrap()
    local wrap = not opt.wrap:get()
    opt.wrap = wrap
    opt.linebreak = wrap
    opt.breakindent = wrap
    opt.textwidth = wrap and 80 or 0
    if wrap then
        opt.formatoptions:append('t')
        vim.notify('Wrap Enabled', vim.log.levels.INFO)
    else
        opt.formatoptions:remove('t')
        vim.notify('Wrap Disabled', vim.log.levels.INFO)
    end
end

nmap('<leader>w', toggle_wrap, { desc = 'Toggle wrap' })
