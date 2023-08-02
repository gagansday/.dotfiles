local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

servers = {
  "jsonls",
  "lua_ls",
  "intelephense",
  "psalm",
  "vuels",
  "tailwindcss",
  "tsserver",
  "theme_check",
  "solc",
}

mason.setup()
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("gagansday.lsp.handlers").on_attach,
    capabilities = require("gagansday.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "gagansday.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end
