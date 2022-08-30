local packer = require('packer')

local function get_config(name)
    return string.format('require("config/%s")', name)
end

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  exec([[packadd packer.nvim]], false)
end

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

packer.startup(function(use)
    use({ 'wbthomason/packer.nvim' })                                                   -- packer management

    use({
        'christoomey/vim-sort-motion',
        config = get_config('vim-sort-motion')
    })                                                                                  -- Sort motions
    use({ 'christoomey/vim-tmux-navigator' })                                           -- tmux/nvim window/pane/split management
    use({ 'easymotion/vim-easymotion' })                                                -- <leader><leader>f,t,s,w
    use({
        'EdenEast/nightfox.nvim',
        config = get_config('nightfox')
    })                                                                                  -- Color scheme
    use({ "famiu/bufdelete.nvim" })                                                     -- Delete buffer w/o closing window
    use({
        'gelguy/wilder.nvim',
        config = get_config('wilder')
    })                                                                                  -- wildmenu plugin
    use ({
        'hrsh7th/nvim-cmp',
        config = get_config('nvim-cmp')
    })
    use ({ 'hrsh7th/cmp-buffer' })
    use ({ 'hrsh7th/cmp-path' })
    use ({ 'hrsh7th/cmp-nvim-lua' })
    use ({ 'hrsh7th/cmp-nvim-lsp' })
    use ({ 'hrsh7th/cmp-nvim-lsp-document-symbol' })
    use ({ 'tamago324/cmp-zsh' })
    use({ 'junegunn/vim-peekaboo' })                                                    -- Register window
    use({
        'kyazdani42/nvim-tree.lua',
        config = get_config('nvim-tree')
    })                                                                                  -- File explorer
    use({ 'kyazdani42/nvim-web-devicons' })                                             -- Icons
    use({
        'lewis6991/gitsigns.nvim',
        config = get_config('gitsigns')
    })                                                                                  -- Git gutter info
    use({ 'markstory/vim-zoomwin' })                                                    -- <leader>z
    use({ 'moll/vim-node' })                                                            -- gd for Node.js require(...)
    use({ 'nelstrom/vim-visual-star-search' })                                          -- Visual mode */# search
    use({
        'neovim/nvim-lspconfig',
        config = get_config('nvim-lspconfig')
    })                                                                                  -- Lsp config
    use({
        'nvim-lualine/lualine.nvim',
        config = get_config('lualine')
    })                                                                                  -- Status line
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'}
        },
        config = get_config('telescope')
    })                                                                                 -- Fuzzy finder
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }                                                                                  -- Telescope sorter
    use({
        'nvim-treesitter/nvim-treesitter',
        config = get_config('nvim-treesitter'),
        requires = {
            { 'nvim-treesitter/playground' },
            { 'p00f/nvim-ts-rainbow' }
        },
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    })
    use({ 'nvim-treesitter/playground' })                                               -- Treesitter playground
    use {
        'onsails/lspkind-nvim',
        requires = { { "famiu/bufdelete.nvim" } }
    }
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
    use({ 'tpope/vim-unimpaired' })                                                     -- Useful key mappings
    use({
        'vimwiki/vimwiki',
        config = get_config('vimwiki')
    })                                                                                  -- Wiki
    use({
        'windwp/nvim-autopairs',
        config = get_config('nvim-autopairs')
    })                                                                                  -- Auto close (), [], {}, '', "", etc...

    if packer_bootstrap then
        packer.sync()
    end
end)

exec([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=true
  augroup end
]], false)
