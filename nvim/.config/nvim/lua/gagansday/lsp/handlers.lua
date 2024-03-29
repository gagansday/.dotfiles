local M = {}

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>Format<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lwd", "<cmd>Telescope lsp_workspace_diagnostics<cr>", opts)
  vim.cmd [[ command! Format execute 'lua LspFormatting()' ]]
end

local lsp_formatting = function()
  local servers = { "null-ls" }
  vim.lsp.buf.format {
    timeout_ms = 5000,
    filter = function(client)
      for _, v in ipairs(servers) do
        return v == client.name
      end
    end,
  }
end

LspFormatting = lsp_formatting

M.on_attach = function(client, bufnr)
  -- vim.notify(client.name .. " starting...")
  -- TODO: refactor this into a method that checks if string in list
  -- if client.name == "tsserver" then
  -- 	client.resolved_capabilities.document_formatting = false
  -- end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      lsp_formatting()
    end,
  })
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
