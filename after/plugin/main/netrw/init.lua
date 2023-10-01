vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 80
vim.g.netrw_menu = 1
-- vim.g.netrw_altv = 0
-- vim.g.netrw_alto = 0
--vim.g.netrw_cursor = 0
--vim.g.netrw_fastbrowse = 2
vim.g.netrw_sort_by = "exten"
vim.g.netrw_sort_direction = "normal"
vim.g.netrw_special_syntax = 1
-- vim.g.netrw_keepdir = 1

-- vim.keymap.set("n", "<leader>fm", ":20Lex<CR>", {desc = "netrw - left pane"})
vim.keymap.set("n", "<leader>fa", vim.cmd.Ex, {desc = "netrw - new buffer"})
vim.keymap.set("n", "<leader>fm", vim.cmd.Ex, {desc = "netrw - new buffer"})
