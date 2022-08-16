-- packer {{{
local fn = vim.fn

function get_config(name)
    return string.format('require("config/%s")', name)
end

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup({
    function(use)
        use({ 'wbthomason/packer.nvim' })                                                   -- packer management

        use({ 'christoomey/vim-sort-motion' })                                              -- Sort motions
        use({ 'christoomey/vim-tmux-navigator' })                                           -- tmux/nvim window/pane/split management
        use({ 'easymotion/vim-easymotion' })                                                -- <leader><leader>f,t,s,w
        use({ 'EdenEast/nightfox.nvim' })                                                   -- Color scheme
        use({ 'fladson/vim-kitty' })                                                        -- Kitty config syntax highlighting
        use({ 'gelguy/wilder.nvim' })                                                       -- wildmenu plugin
        use({ 'junegunn/fzf.vim' })                                                         -- Fuzzy finder
        use({ 'junegunn/vim-peekaboo' })                                                    -- Register window
        use({ 'kyazdani42/nvim-tree.lua' })                                                 -- File explorer
        use({ 'kyazdani42/nvim-web-devicons' })                                             -- Icons
        use({
            'lewis6991/gitsigns.nvim',
            config = get_config('gitsigns')
        })                                                                                  -- Git gutter info
        use({ 'markstory/vim-zoomwin' })                                                    -- <leader>z
        use({ 'moll/vim-node' })                                                            -- gd for Node.js require(...)
        use({ 'nelstrom/vim-visual-star-search' })                                          -- Visual mode */# search
        use({
            'neoclide/coc.nvim',
            branch = 'release',
            config = get_config('coc')
        })                                                                                  -- Lsp management
        use({
            'nvim-lualine/lualine.nvim',
            config = get_config('lualine')
        })                                                                                  -- Status line
        use({
            'nvim-treesitter/nvim-treesitter',
            config = get_config('nvim-treesitter'),
            requires = {
                { 'nvim-treesitter/playground' },
                { 'p00f/nvim-ts-rainbow' }
            },
            run = ':TSUpdate'
        })
        use({ 'nvim-treesitter/playground' })                                               -- Treesitter playground
        use({ 'p00f/nvim-ts-rainbow' })                                                     -- Rainbow (), [], {}
        use({ 'tomtom/tcomment_vim' })                                                      -- Comment motions
        use({
            'tpope/vim-fugitive',
            config = get_config('vim-fugitive')
        })                                                                                  -- Git commands
        use({
            'tpope/vim-obsession',
            config = get_config('vim-obsession')
        })                                                                                  -- Session management
        use({ 'tpope/vim-repeat' })                                                         -- Better Repeat
        use({ 'tpope/vim-surround' })                                                       -- Surround motions
        use({
            'vimwiki/vimwiki',
            config = get_config('vimwiki')
        })                                                                                  -- Wiki

        use({ 'tpope/vim-unimpaired' })                                                     -- Useful key mappings
        use({ 'windwp/nvim-autopairs' })                                                    -- Auto close (), [], {}, '', "", etc...

        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        enable = true,
        threshold = 0,
        max_jobs = 20,
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end,
        },
    }
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=true
  augroup end
]])
-- packer }}}

-- christoomey/vim-sort-motion {{{
global.sort_motion_flags = 'ui'
-- }}}

-- easymotion/vim-easymotion {{{
create_autocmd('User', { pattern = 'EasyMotionPromptBegin', command = 'CocDisable' })
create_autocmd('User', { pattern = 'EasyMotionPromptEnd', command = 'CocEnable' })
-- }}}

-- EdenEast/nightfox.nvim {{{
require('nightfox').setup({
    options = {
        transparent = true,
        dim_inactive = true,
        styles = {
            keywords = 'bold',
        },
    },
    groups = {
        all = {
            IncSearch = { fg ='#393b44', bg = '#F4A261' },
            NormalNC = { bg = '#303030' },
            Search = { fg ='#393b44', bg = '#F4A261' },
            CursorLine = { bg = '#1C1C1C' },
            CursorColumn = { bg = '#1C1C1C' },
            Substitute = { fg ='#FFFFFF' },
        },
    },
})

vim.cmd([[colorscheme nightfox]])
-- }}}

-- gelguy/wilder.nvim {{{
local wilder = require('wilder')

wilder.setup({
    modes = {':'},
    next_key = '<C-J>',
    previous_key = '<C-K>',
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        border = 'rounded',
        highlights = {
            border = 'Normal',
        },
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
    })
))

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline({
            language = 'python',
            fuzzy = 2,
        })
    ),
})
-- }}}

-- kyazdani42/nvim-tree.lua {{{
require('nvim-tree').setup({
    view = {
        adaptive_size = true,
    },
})
-- }}}

-- windwp/nvim-autopairs {{{
require('nvim-autopairs').setup()
-- }}}
