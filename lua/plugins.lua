local fn = vim.fn
local packer = require('packer')

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

packer.startup({
    function(use)
        use({ 'wbthomason/packer.nvim' })

        use({ 'christoomey/vim-sort-motion' })
        use({ 'christoomey/vim-tmux-navigator' })
        use({ 'tpope/vim-unimpaired' })
        use({ 'windwp/nvim-autopairs', config = require('nvim-autopairs').setup() })

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
