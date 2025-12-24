local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then return end

local handlers = require("lsp.handlers")
handlers.setup()

require('neodev').setup()

local servers = {
  rust_analyzer = {
    cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' }
  },
  lua_ls = {}, -- Settings are pulled from lsp/settings/lua_ls.lua
  -- pyright = {},
}

require('mason').setup({
  ui = { border = "rounded" }
})

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup({
  function(server_name)
    local opts = {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    }

    -- Apply specific server settings if they exist
    local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server_name)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    -- If the server has a table in the 'servers' list above, merge it too
    if servers[server_name] then
      opts = vim.tbl_deep_extend("force", opts, servers[server_name])
    end

    lspconfig[server_name].setup(opts)
  end,
})
