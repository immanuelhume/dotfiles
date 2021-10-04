vim.o.bg = 'light'
vim.g.colors_name = 'PaperColor'
vim.o.termguicolors = true
vim.o.syntax = 'on'

-- treesitter
local configs = require'nvim-treesitter.configs'
configs.setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	}
}
