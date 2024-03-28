local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function get_config(name)
    return load(string.format('require("config/%s")', name))
end

local plugins = {
    {   -- Sort motions
        'christoomey/vim-sort-motion',
        event = 'VeryLazy',
    },
    {   -- tmux/nvim window/pane/split management
        'christoomey/vim-tmux-navigator',
        event = 'VeryLazy',
    },
    {   -- Custom view/edit for Lsp definitions and references
        'DNLHC/glance.nvim',
        init = get_config('glance'),
    },
    {   -- Highlight current indent
        'echasnovski/mini.indentscope',
        branch = 'stable',
        init = get_config('mini-indentscope'),
    },
    {   -- Surround motions
        'echasnovski/mini.surround',
        branch = 'stable',
        init = get_config('mini-surround'),
    },
    {   -- Color scheme
        'EdenEast/nightfox.nvim',
        init = get_config('nightfox'),
    },
    {   -- Delete buffer w/o closing window
        'famiu/bufdelete.nvim',
    },
    {
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            {
                'rcarriga/nvim-notify',
                init = get_config('notify'),
            },
        },
        init = get_config('noice'),
    },
    {   -- Diagnostics quick fix list
        'folke/trouble.nvim',
        init = get_config('trouble'),
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {},
    },
    {   -- wild menu plugin
        'gelguy/wilder.nvim',
        build = ':UpdateRemotePlugins',
        init = get_config('wilder'),
    },
    {   -- Lsp UI upgrade
        'glepnir/lspsaga.nvim',
        branch = 'main',
        init = get_config('lspsaga'),
    },
    {   -- Lsp auto-complete
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
        },
        init = get_config('nvim-cmp'),
    },
    {   -- Color visualizer
        'norcalli/nvim-colorizer.lua',
        init = get_config('nvim-colorizer'),
    },
    {   -- Mason/null-ls auto installer
        'jayp0521/mason-null-ls.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'jose-elias-alvarez/null-ls.nvim',
        },
        event = 'VeryLazy',
    },
    {   -- Comment String extension (JSX support)
        'JoosepAlviste/nvim-ts-context-commentstring',
        init = get_config('ts-context-commentstring'),
    },
    {   -- Non Lsp Client hooks
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        init = get_config('null-ls'),
    },
    {   -- Lsp Typescript utilities
        'jose-elias-alvarez/nvim-lsp-ts-utils',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        event = 'VeryLazy',
    },
    {   -- Register window
        'junegunn/vim-peekaboo',
        event = 'VeryLazy',
    },
    {   -- Git gutter info
        'lewis6991/gitsigns.nvim',
        init = get_config('gitsigns'),
    },
    {   -- <leader>z
        'markstory/vim-zoomwin',
        event = 'VeryLazy',
    },
    {   -- gd for Node.js require(...)
        'moll/vim-node',
        event = 'VeryLazy',
    },
    {
        'MunifTanjim/nui.nvim'
    },
    {   -- Lsp config
        'neovim/nvim-lspconfig',
        init = get_config('nvim-lspconfig'),
    },
    {   -- Comments
        'numToStr/Comment.nvim',
        init = get_config('Comment'),
    },
    {   -- Status line
        'nvim-lualine/lualine.nvim',
        init = get_config('lualine'),
    },
    {   -- Telescope
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'debugloop/telescope-undo.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
            'nvim-telescope/telescope-node-modules.nvim',
            'piersolenski/telescope-import.nvim',
        },
        tag = '0.1.4',
        init = get_config('telescope'),
    },
    {   -- Treesitter
        'nvim-treesitter/nvim-treesitter',
        build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        init = get_config('nvim-treesitter'),
    },
    {   -- Treesitter function/class text objects
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        event = 'VeryLazy',
        init = get_config('nvim-treesitter-textobjects'),
    },
    {   -- LSP pictograms
        'onsails/lspkind-nvim',
        dependencies = {
            'famiu/bufdelete.nvim',
        },
    },
    {
        'rcarriga/nvim-notify',
    },
    {   -- Tabs
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = get_config('barbar'),
    },
    {   -- ZSH auto completion
        'tamago324/cmp-zsh',
        event = 'VeryLazy',
    },
    {   -- nvim-cmp fuzzy finder for / and ?
        'tzachar/cmp-fuzzy-buffer',
        dependencies = {
            'hrsh7th/nvim-cmp',
            'tzachar/fuzzy.nvim',
        },
        event = 'VeryLazy',
    },
    {   -- Git commands
        'tpope/vim-fugitive',
        event = 'VeryLazy',
    },
    {   -- Session management
        'tpope/vim-obsession',
        lazy = false,
    },
    {   -- Better Repeat
        'tpope/vim-repeat',
        event = 'VeryLazy',
    },
    {   -- Useful key mappings
        'tpope/vim-unimpaired',
        event = 'VeryLazy',
    },
    {   -- Wiki
        'vimwiki/vimwiki',
        event = 'VeryLazy',
        init = get_config('vimwiki'),
    },
    {   -- Lsp install management
        'williamboman/mason.nvim',
    },
    {   -- Lsp config interop
        'williamboman/mason-lspconfig.nvim',
    },
    {   -- Auto close (), [], {}, '', "", etc...
        'windwp/nvim-autopairs',
        init = get_config('nvim-autopairs'),
    },
    {   -- Auto close <div> etc...
        'windwp/nvim-ts-autotag',
        event = 'VeryLazy',
        init = get_config('nvim-ts-autotag'),
    },
    {
        'xiyaowong/transparent.nvim',
        lazy = false,
    },
}

local opts = {
    defaults = {
        lazy = true,
    },
}

require("lazy").setup(plugins, opts)
