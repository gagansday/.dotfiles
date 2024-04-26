local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end

nightfox.setup {
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath "cache" .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false, -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = true, -- Non focused panes set to alternative background
    styles = { -- Style to be applied to different syntax groups
      comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "bold",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = { -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = { -- List of various plugins and additional options
      -- ...
    },
  },
}

-- setup must be called before loading
vim.cmd "colorscheme nightfox"
-- set background=dark

local indent_blankline_ok, indent_blankline = pcall(require, "indent_blankline")
if indent_blankline_ok then
  indent_blankline.setup {
    space_char_blankline = " ",
  }
end

local colorizer_ok, colorizer = pcall(require, "colorizer")
if colorizer_ok then
  colorizer.setup {}
  vim.cmd [[
		augroup colorizer_settings
			autocmd!
			autocmd FileType * :ColorizerAttachToBuffer
		augroup end
	]]
end
