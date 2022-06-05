-- vim.cmd [[
-- try
--  colorscheme onedark
-- catch /^Vim\%((\a\+)\)\=:E185/
--  colorscheme default
--  set background=dark
-- endtry
-- ]]

vim.o.background = "dark" -- to load onedark
-- vim.o.background = "light" -- to load onelight
require("onedarkpro").load()
