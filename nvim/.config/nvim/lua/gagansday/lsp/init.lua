local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "gagansday.lsp.configs"
require "gagansday.lsp.null-ls"
