exec([[
function! StripTrailingWhitespace()
    if &ft =~ 'markdown' | return | endif
    %s/\s\+$//e
endfunction

function! IsExcludedFileType()
    if &ft =~ 'NvimTree'
        return 'excluded'
    elseif &ft =~ 'sagarename'
        return 'excluded'
    endif
endfunction

function! TurnOnRelativeNumber()
    if IsExcludedFileType() =~ 'excluded' | return | endif
    set number relativenumber
endfunction

function! TurnOffRelativeNumber()
    if IsExcludedFileType() =~ 'excluded'| return | endif
    set number norelativenumber
endfunction
]], false)

local turn_on_relative_number = function()
    vim.api.nvim_call_function('TurnOnRelativeNumber', {})
end
create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave' }, { callback = turn_on_relative_number })

local turn_off_relative_number = function()
    vim.api.nvim_call_function('TurnOffRelativeNumber', {})
end
create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter' }, { callback = turn_off_relative_number })

create_autocmd({ 'BufRead' }, { command = 'setlocal foldmethod=marker' })

local strip_trailing_white_space = function()
    vim.api.nvim_call_function('StripTrailingWhitespace', {})
end
create_autocmd({ 'BufWritePre' }, { callback = strip_trailing_white_space })

create_autocmd({ 'FileType' }, { command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' })

create_autocmd({ 'VimResized' }, { command = 'wincmd =' })

create_autocmd({ 'BufEnter' }, { command = 'set ft=.gitconfig', pattern = '*/git/config' })

create_autocmd("FileType", { pattern = "checkhealth", callback = function() vim.opt_local.spell = false end })

