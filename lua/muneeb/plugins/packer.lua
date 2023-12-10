vim.cmd.colorscheme "catppuccin"
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
    use { "catppuccin/nvim", as = "catppuccin"}
  
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
    }
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
            'nvim-tree/nvim-web-devicons',
            'antosha417/nvim-lsp-file-operations'
        },
    }
end)
