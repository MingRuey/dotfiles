return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'nvim-telescope/telescope.nvim', tag="nvim-0.6"}
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'pwntester/octo.nvim',
    config = function ()
      require"octo".setup()
    end
  }
end)

