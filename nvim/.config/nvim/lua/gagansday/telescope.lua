local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    -- path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules/", "vendor/" },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        ["<CR>"] = actions.select_default,
        ["<C-l>"] = actions.select_horizontal,
        ["<C-h>"] = actions.select_vertical,
      },
    },
  },
}
