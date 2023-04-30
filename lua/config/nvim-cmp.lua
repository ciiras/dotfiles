local cmp = require 'cmp'
local lspkind = require('lspkind')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

lspkind.init({
    symbol_map = {
        Text = '',
        Method = '',
        Function = '',
        Constructor = '',
        Field = 'ﰠ',
        Variable = '',
        Class = 'ﴯ',
        Interface = '',
        Module = '',
        Property = 'ﰠ',
        Unit = '塞',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = 'פּ',
        Event = '',
        Operator = '',
        TypeParameter = ''
    }
})

cmp.setup({
    formatting = {
        format = lspkind.cmp_format {
            with_text = false,
            maxwidth = 50,
            menu = {
                buffer = 'BUF',
                nvim_lsp = 'LSP',
                path = 'PATH',
                calc = 'CALC',
                spell = 'SPELL',
                emoji = 'EMOJI'
            }
        }
    },
    experimental = {native_menu = false, ghost_text = false},
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 'c', 's'}),
        ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, {'i', 'c', 's'})
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'buffer', keyword_length = 5},
        {name = 'calc'},
        {name = 'emoji'},
        {name = 'spell'},
        {name = 'path'},
    },
    window = {
          completion = cmp.config.window.bordered(),
    },
})

cmp.setup.cmdline({ '/', '?' }, {
    sources = {
        {name = 'buffer'}
    }
})
