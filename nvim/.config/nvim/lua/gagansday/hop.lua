local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

hop.setup()

-- Hop
vim.api.nvim_set_keymap(
	"n",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"n",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"n",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	{}
)

vim.api.nvim_set_keymap(
	"n",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	{}
)

vim.api.nvim_set_keymap(
	"n",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	{}
)

vim.api.nvim_set_keymap("n", "hw", "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap("n", "hp", "<cmd>lua require'hop'.hint_patterns()<cr>", {})
vim.api.nvim_set_keymap("n", "hv", "<cmd>lua require'hop'.hint_vertical()<cr>", {})
vim.api.nvim_set_keymap("n", "hl", "<cmd>lua require'hop'.hint_lines()<cr>", {})
vim.api.nvim_set_keymap("n", "ha", "<cmd>lua require'hop'.hint_anywhere()<cr>", {})
