local fn = vim.fn
local packer = require('packer')

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

packer.init({
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being 'stuck' -> https://github.com/wbthomason/packer.nvim/issues/746
    display = { -- Have packer use a popup window
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})

packer.startup(function(use)
    use({ 'wbthomason/packer.nvim' })

    use({ 'windwp/nvim-autopairs', config = require('nvim-autopairs').setup() })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
