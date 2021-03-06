local lspconfig = require'lspconfig'
USER = vim.fn.expand('$USER')

-- for servers which don't require any special configurations
lspconfig.bashls.setup{}
lspconfig.tsserver.setup{}

local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- pyright
local pyright_bin = "/home/" .. USER .. "/.local/share/nvim/lspinstall/python/node_modules/.bin/pyright-langserver"
lspconfig.pyright.setup {
  cmd = {pyright_bin, "--stdio"}
}

-- sumneko
local sumneko_root = "/home/" .. USER .. "/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server"
local sumneko_binary = "/home/" .. USER .. "/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server/bin/Linux/lua-language-server"
lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root .. "/main.lua"},
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
}

-- gopls
lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- Go automatic imports
function Goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end else
      vim.lsp.buf.execute_command(action)
    end
  end

vim.api.nvim_command('autocmd BufWritePre *.go lua Goimports(1000)')
vim.api.nvim_command('autocmd BufWritePre *.go lua vim.lsp.buf.formatting()')

-- Rust Analyzer
lspconfig.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
