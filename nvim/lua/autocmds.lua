exec([[
function! StripTrailingWhitespace()
    if &ft =~ 'markdown' | return | endif
    %s/\s\+$//e
endfunction

]], false)

create_autocmd({ 'BufRead' }, { command = 'setlocal foldmethod=marker' })

local strip_trailing_white_space = function()
    vim.api.nvim_call_function('StripTrailingWhitespace', {})
end
create_autocmd({ 'BufWritePre' }, { callback = strip_trailing_white_space })

create_autocmd({ 'FileType' }, { command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' })

create_autocmd({ 'VimResized' }, { command = 'wincmd =' })

create_autocmd({ 'BufEnter' }, { command = 'set ft=.gitconfig', pattern = '*/git/config' })

create_autocmd("FileType", { pattern = "checkhealth", callback = function() vim.opt_local.spell = false end })

