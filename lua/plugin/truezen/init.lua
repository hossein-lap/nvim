require("true-zen").setup {
	modes = { -- configurations per mode
		ataraxis = {
			-- if `dark` then dim the padding windows,
			-- otherwise if it's `light` it'll brighten said windows
			shade = "dark",
			-- percentage by which padding windows should be dimmed/brightened.
			-- Must be a number between 0 and 1. Set to 0 to keep the same background color
			backdrop = 0,
			minimum_writing_area = { -- minimum size of main window
				width = 70,
				height = 44,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
			padding = { -- padding windows
				left = 52,
				right = 52,
				top = 0,
				bottom = 0,
			},
			options = { -- options to be disabled when entering Minimalist mode
				number = false,
				relativenumber = false,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1
			},
			callbacks = { -- run functions when opening/closing Ataraxis mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		},
		minimalist = {
			-- save current options from any window except ones displaying these kinds of buffers
			ignored_buf_types = { "nofile" },
			options = { -- options to be disabled when entering Minimalist mode
				number = false,
				relativenumber = false,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1
			},
			callbacks = { -- run functions when opening/closing Minimalist mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		},
		narrow = {
			--- change the style of the fold lines. Set it to:
			--- `informative`: to get nice pre-baked folds
			--- `invisible`: hide them
			--- function() end: pass a custom func with your fold lines. See :h foldtext
			folds_style = "informative",
			run_ataraxis = true, -- display narrowed text in a Ataraxis session
			options = { -- options to be disabled when entering Minimalist mode
				number = false,
				relativenumber = false,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1
			},
			callbacks = { -- run functions when opening/closing Narrow mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		},
		focus = {
			options = { -- options to be disabled when entering Minimalist mode
				number = false,
				relativenumber = false,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 0,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1
			},
			callbacks = { -- run functions when opening/closing Focus mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		}
	},
	integrations = {
		tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
		-- increment font size in Kitty.
		-- Note: you must set `allow_remote_control socket-only`
			-- and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
		kitty = {
			enabled = false,
			font = "+3"
		},
		twilight = false, -- enable twilight (ataraxis)
		lualine = true -- hide nvim-lualine (ataraxis)
	},
}

vim.keymap.set("n", "<leader>wf", ":TZAtaraxis<CR>",
	{desc = 'Zen Mode - Ataraxis', silent = true, noremap = true})
vim.keymap.set("v", "<leader>wf", ":TZNarrow<CR>",
	{desc = 'Zen Mode - Narrow', silent = true, noremap = true})
vim.keymap.set("n", "<localleader>wf", ":TZMinimalist<CR>",
	{desc = 'Zen Mode - Minimalist', silent = true, noremap = true})
vim.keymap.set("n", "<localleader>wf", ":TZFocus<CR>",
	{desc = 'Zen Mode - Focus', silent = true, noremap = true})
