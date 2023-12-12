local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  exec([[packadd packer.nvim]], false)
end

local packer = require('packer')
packer.init({
    enable = true,
    threshold = 0,
    max_jobs = 20,
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})

local function get_config(name)
    return string.format('require("config/%s")', name)
end

packer.startup(function(use)
    use ({ 'wbthomason/packer.nvim' })                                                  -- packer management

    use ({ 'christoomey/vim-sort-motion' })                                             -- Sort motions
    use ({ 'christoomey/vim-tmux-navigator' })                                          -- tmux/nvim window/pane/split management
    use ({
        'DNLHC/glance.nvim',
        config = get_config('glance'),
    })                                                                                  -- Custom view/edit for Lsp definitions and references
    use ({ 'dstein64/vim-startuptime' })                                                -- Startup time profiling
    use {
        'echasnovski/mini.indentscope',
        branch = 'stable',
        config = get_config('mini-indentscope'),
    }                                                                                   -- Highlight current indent
    use {
        'echasnovski/mini.surround',
        branch = 'stable',
        config = get_config('mini-surround'),
    }                                                                                   -- Surround motions
    use ({
        'EdenEast/nightfox.nvim',
        config = get_config('nightfox'),
    })                                                                                  -- Color scheme
    use ({ 'famiu/bufdelete.nvim' })                                                    -- Delete buffer w/o closing window
    use ({
        'folke/trouble.nvim',
        config = get_config('trouble'),
    })                                                                                  -- Diagnostics quick fix list
    use ({
        'gelguy/wilder.nvim',
        config = get_config('wilder'),
        run = ':UpdateRemotePlugins'
    })                                                                                  -- wildmenu plugin
    use ({
        'glepnir/lspsaga.nvim',
        after = 'nvim-lspconfig',
        branch = 'main',
        config = get_config('lspsaga'),
    })                                                                                  -- Lsp UI upgrade
    use ({
        'hrsh7th/nvim-cmp',
        config = get_config('nvim-cmp'),
    })                                                                                  -- Lsp autocomplete
    use ({ 'hrsh7th/cmp-buffer' })
    use ({ 'hrsh7th/cmp-path' })
    use ({ 'hrsh7th/cmp-nvim-lua' })
    use ({ 'hrsh7th/cmp-nvim-lsp' })
    use ({ 'hrsh7th/cmp-nvim-lsp-document-symbol' })
    use ({
        'norcalli/nvim-colorizer.lua',
        config = get_config('nvim-colorizer'),
    })                                                                                  -- Color visualizer
    use ({
        'jayp0521/mason-null-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'jose-elias-alvarez/null-ls.nvim',
        },
    })                                                                                  -- Mason/null-ls auto installer
    use ({
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = get_config('ts-context-commentstring'),
    })                                                                                  -- Comment String extension (JSX support)
    use ({
        'jose-elias-alvarez/null-ls.nvim',
        config = get_config('null-ls'),
        requires = {
            'nvim-lua/plenary.nvim',
        },
    })                                                                                  -- Non Lsp Client hooks
    use ({
        'jose-elias-alvarez/nvim-lsp-ts-utils',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    })                                                                                  -- Lsp TypeScript utilities
    use ({ 'junegunn/vim-peekaboo' })                                                   -- Register window
    use ({ 'kyazdani42/nvim-web-devicons' })                                            -- Icons
    use ({
        'lewis6991/gitsigns.nvim',
        config = get_config('gitsigns'),
    })                                                                                  -- Git gutter info
    use ({ 'markstory/vim-zoomwin' })                                                   -- <leader>z
    use ({ 'moll/vim-node' })                                                           -- gd for Node.js require(...)
    use ({ 'RRethy/vim-illuminate' })                                                   -- Highlight word under cursor
    use ({
        'neovim/nvim-lspconfig',
        config = get_config('nvim-lspconfig'),
    })                                                                                  -- Lsp config
    use ({
        'numToStr/Comment.nvim',
        config = get_config('Comment'),
    })                                                                                  -- Comments
    use ({
        'nvim-lualine/lualine.nvim',
        config = get_config('lualine'),
    })                                                                                  -- Status line
    use ({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = get_config('telescope'),
    })                                                                                  -- Fuzzy finder
    use ({
        'nvim-telescope/telescope-file-browser.nvim'
    })                                                                                  -- Telescope file browser
    use ({
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    })                                                                                  -- Telescope sorter
    use ({
        'nvim-treesitter/nvim-treesitter',
        config = get_config('nvim-treesitter'),
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    })                                                                                  -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
        config = get_config('nvim-treesitter-textobjects'),
        requires = {
            'nvim-treesitter/nvim-treesitter',
        },
    })                                                                                  -- Treesitter function/class textobjects
    use ({
        'onsails/lspkind-nvim',
        requires = {
            'famiu/bufdelete.nvim',
        },
    })
    use ({
        'romgrk/barbar.nvim',
        config = get_config('barbar'),
        requires = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
    })                                                                                  -- Tabs
    use ({ 'tamago324/cmp-zsh' })                                                       -- ZSH auto completion
    use ({ 'tzachar/cmp-fuzzy-buffer',
        requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}
    })                                                                                  -- nvim-cmp fuzzy finder for / and ?
    use ({ 'tpope/vim-fugitive', })                                                     -- Git commands
    use ({ 'tpope/vim-obsession' })                                                     -- Session management
    use ({ 'tpope/vim-repeat' })                                                        -- Better Repeat
    use ({ 'tpope/vim-unimpaired' })                                                    -- Useful key mappings
    use ({
        'vimwiki/vimwiki',
        config = get_config('vimwiki'),
    })                                                                                  -- Wiki
    use ({
        'williamboman/mason.nvim',
    })                                                                                  -- Lsp install management
    use ({
        'williamboman/mason-lspconfig.nvim',
    })                                                                                  -- Lsp config interop
    use ({
        'windwp/nvim-autopairs',
        config = get_config('nvim-autopairs'),
    })                                                                                  -- Auto close (), [], {}, '', "", etc...

    if Packer_Bootstrap then
        packer.sync()
    end
end)

exec([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=true
  augroup end
]], false)
