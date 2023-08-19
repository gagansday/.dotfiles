local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
  return
end

mason_null_ls.setup {
  ensure_installed = {
    "blade_formatter",
    "codespell",
    "pint",
    "prettierd",
    "solhint",
    "stylua",
  },
  automatic_installation = true,
}

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.blade_formatter,
    formatting.codespell,
    formatting.pint,
    -- formatting.prettier.with {
    --   filetypes = { "solidity", "astro" },
    -- },
    -- formatting.prettierd,
    formatting.prettierd.with {
      filetypes = { "solidity", "astro" },
    },
    formatting.stylua,
    diagnostics.solhint,
  },
}
