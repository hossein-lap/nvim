local harpoon = require('harpoon')
local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

-- -- settings {{{
-- local opts = {
-- 	-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
-- 	save_on_toggle = false,
--
-- 	-- saves the harpoon file upon every change. disabling is unrecommended.
-- 	save_on_change = true,
--
-- 	-- sets harpoon to run the command immediately
-- 	-- as it's passed to the terminal when calling `sendCommand`.
-- 	enter_on_sendcmd = false,
--
-- 	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
-- 	tmux_autoclose_windows = false,
--
-- 	-- filetypes that you want to prevent from adding to the harpoon list menu.
-- 	excluded_filetypes = {
-- 		"harpoon", "NvimTree", "Terminal", "skels", "undotree", "Netrw",
-- 		"toggleterm",
-- 	},
--
-- 	-- set marks specific to each git branch inside git repository
-- 	mark_branch = false,
--
-- 	-- enable tabline with harpoon marks
-- 	tabline = false,
-- 	tabline_prefix = "   ",
-- 	tabline_suffix = "   ",
-- 	menu = {
-- 		width = vim.api.nvim_win_get_width(0) - 4,
-- 	}
-- }
--
-- -- }}}
--
-- harpoon.setup({opts})

-- highlights {{{

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

-- }}}

-- keybinds {{{

vim.keymap.set('n', '<leader>ht', function() ui.toggle_quick_menu() end, {})
vim.keymap.set('n', '<leader>ha', function() mark.add_file() end, {})
-- vim.keymap.set('n', '<leader>hd', function() ui.toggle_quick_menu() end, {})
vim.keymap.set('n', '<leader>hn', function() ui.nav_next() end, {})
vim.keymap.set('n', '<leader>hp', function() ui.nav_prev() end, {})
vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end, {})
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end, {})
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end, {})
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end, {})

-- }}}
