local use = require'packer'.use

require('packer').startup(function()
  -- theme
  use 'NLKNguyen/papercolor-theme'

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

  -- fuzzy finding
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'
end
)
