local g = vim.g

g.nvim_tree_gitignore = 1
g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
g.nvim_tree_width = 24

vim.cmd('nnoremap <C-n> :NvimTreeToggle<CR>')
vim.cmd('nnoremap <leader>r :NvimTreeRefresh<CR>')
vim.cmd('nnoremap <leader>n :NvimTreeFindFile<CR>')
-- NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

vim.cmd('highlight NvimTreeFolderIcon guibg=blue')

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

