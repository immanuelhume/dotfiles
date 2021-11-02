local use = require'packer'.use

require('packer').startup(function()
  -- look
  use { 'NLKNguyen/papercolor-theme', }
  use { 'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- lsp, completion, and syntax highlighting
  use 'neovim/nvim-lspconfig'
  -- use 'nvim-lua/completion-nvim'
  use 'kabouzeid/nvim-lspinstall'
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }

  -- fuzzy finding
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'

  -- file explorer
  use { 'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  }
end
)
