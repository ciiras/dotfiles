global.coc_global_extensions = {'coc-tsserver', 'coc-tslint-plugin', 'coc-angular', 'coc-eslint', 'coc-json', 'coc-spell-checker', 'coc-actions', 'coc-prettier'}

function show_documentation()
    local filetype = vim.bo.filetype
    if filetype == 'vim' or filetype == 'help' then
        vim.api.nvim_command('h ' .. vim.fn.expand('<cword>'))
    elseif vim.fn['coc#rpc#ready']() then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command(
            '!' .. vim.bo.keywordprg .. ' ' .. vim.fn.expand('<cword>')
        )
    end
end

local coc_highlight = function()
    vim.api.nvim_call_function('CocActionAsync', { 'highlight' })
end
create_autocmd('CursorHold', { callback = coc_highlight })

vim.cmd([[
augroup mygroup
  au!
  au FileType typescript,json setl formatexpr=CocAction('formatSelected')
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : '<Tab>'
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : '<C-H>'

inoremap <silent><expr> <C-J> coc#pum#visible() ? coc#pum#next(1) : pumvisible() ? '<C-N>' : '<C-J>'
inoremap <silent><expr> <C-K> coc#pum#visible() ? coc#pum#prev(1) : pumvisible() ? '<C-P>' : '<C-K>'

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><c-r>=coc#on_enter()<CR>'

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-U>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-U>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
]])

create_usercmd('Prettier', ':CocCommand prettier.formatFile', {})

nmap('[g', '<Plug>(coc-diagnostic-prev)')
nmap(']g', '<Plug>(coc-diagnostic-next)')

nmap('gd', '<Plug>(coc-definition)')
nmap('gy', '<Plug>(coc-type-definition)')
nmap('gi', '<Plug>(coc-implementation)')
nmap('gr', '<Plug>(coc-references)')

nmap('K', ':lua show_documentation() <CR>')

nmap('<leader>rn', '<Plug>(coc-rename)')

nmap('<leader>ac', '<Plug>(coc-codeaction)')
vmap('<leader>a', '<Plug>(coc-codeaction-selected)')
nmap('<leader>a', '<Plug>(coc-codeaction-selected)')

nmap('<leader>qf', '<Plug>(coc-fix-current)')

nmap('<space>a', ':<C-U>CocList diagnostics<CR>')
nmap('<space>o', ':<C-U>CocList outline<CR>')
nmap('<space>y', ':<C-U>CocList -I symbols<CR>')

vmap('<leader>lf', ':Prettier<CR>')
nmap('<leader>lf', ':Prettier<CR>')
vmap('<leader>ls', '<Plug>(coc-format-selected)')
nmap('<leader>ls', '<Plug>(coc-format-selected)')
xmap('<leader>ls', '<Plug>(coc-format-selected)')