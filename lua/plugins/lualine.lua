return {
	"nvim-lualine/lualine.nvim",
	config = function()

		local enable_icon = true

		-- colors {{{
		local color_list = {

		--	none {{{
			none = {
				white    = '#ffffff',
				bg       = '#181818',
				black    = '#232323',
				fg       = '#bbc2cf',
				gray     = '#777777',
				yellow   = '#F3E430',
				cyan     = '#77eeff',
				darkblue = '#081633',
				green    = '#33cc33',
				orange   = '#ff9c00',
				violet   = '#ff5f87',
				purple   = '#d6acff',
				blue     = '#00aaff',
				red      = '#d70000',
				special  = '#ffaf5f',
			},
		--	}}}
		--	basic {{{
			basic = {
				white    = '#ffffff',
				bg    = '#191919',
				black       = '#232323',
				fg       = '#bbc2cf',
				gray     = '#0D1016',
				yellow   = '#ECBE7B',
				cyan     = '#0022ff',
				darkblue = '#081633',
				green    = '#98be65',
				orange   = '#FF8800',
				violet   = '#a9a1e1',
				purple   = '#c678dd',
				blue     = '#00aaff',
				red      = '#ec5f67',
				special  = '#ffaf5f',
			},
		--	}}}
		--	hybrid {{{
			hybrid = {
				white    = '#c5c8c6',
				black    = '#161616',
				bg       = '#000000',
				fg       = '#c5c8c6',
				gray     = '#707880',
				yellow   = '#f0c674',
				cyan     = '#8abeb7',
				darkblue = '#00005f',
				green    = '#b5bd68',
				orange   = '#de935f',
				violet   = '#d7d7ff',
				purple   = '#b294bb',
				blue     = '#81a2be',
				red      = '#cc6666',
				special  = '#ffaf5f',
			},
		--	}}}
		--	ayu-dark {{{
			["ayu-dark"] = {
				purple = '#c678dd',
				accent = '#E6B450',
				fg = '#B3B1AD',
				ui = '#4D5566',
				white = "#ffffff",
				blue = '#39BAE6',
				-- orange = '#FFB454',
				entity = '#59C2FF',
				green = '#C2D94C',
				cyan = '#95E6CB',
				red = '#F07178',
				orange = '#FF8F40',
				gray = '#626A73',
				yellow = '#FFEE99',
				operator = '#F29668',
				error = '#FF3333',
				bg = '#000000',
				black = '#11121b',
				bg1 = '#1B2733',
				bg2 = '#242A35',
				bg3 = '#273747',
				fg_idle = '#3E4B59',
				guide_active = '#393F4D',
				gutter_active = '#464D5E',
				gutter_normal = '#323945',
				panel_bg = '#0D1016',
				panel_border = '#000000',
				panel_shadow = '#00010A',
				selection_border = '#304357',
				vcs_added = '#91B362',
				vcs_added_bg = '#1D2214',
				vcs_modified = '#6994BF',
				vcs_removed = '#D96C75',
				vcs_removed_bg = '#2D2220',
				warning = '#FF8F40',
				special  = '#ffaf5f',
			},
		--	}}}
		--	dracula {{{
			dracula = {
				bg = "#191A21",
				black = "#21222C",
				fg = "#F8F8F2",
				selection = "#44475A",
				comment = "#6272A4",
				red = "#FF5555",
				orange = "#FFB86C",
				yellow = "#F1FA8C",
				green = "#50fa7b",
				blue = "#BD93F9",
				purple = "#9082f7",
				cyan = "#8BE9FD",
				pink = "#FF79C6",
				bright_red = "#FF6E6E",
				bright_green = "#69FF94",
				bright_yellow = "#FFFFA5",
				bright_blue = "#D6ACFF",
				bright_magenta = "#FF92DF",
				bright_cyan = "#A4FFFF",
				bright_white = "#FFFFFF",
				gray = "#21222C",
				visual = "#3E4452",
				gutter_fg = "#4B5263",
				nontext = "#3B4048",
				white = "#ABB2BF",
				special  = '#ffaf5f',
			},
		--	}}}
		-- tokyodark {{{
			tokyodark = {
		--		white = "#ffffff",
				bg = "#000000",
				bg1 = "#06080A",
				black = "#11121D",
				gray = "#1A1B2A",
				bg2 = "#212234",
				bg3 = "#353945",
				white = "#4A5057",
				bg5 = "#282c34",
				bg_red = "#FE6D85",
				bg_green = "#98C379",
				bg_blue = "#9FBBF3",
				diff_red = "#773440",
				diff_green = "#587738",
				diff_blue = "#2a3a5a",
				diff_add = "#1E2326",
				diff_change = "#262b3d",
				diff_delete = "#281B27",
				diff_text = "#1c4474",
				fg = "#A0A8CD",
				red = "#EE6D85",
				orange = "#F6955B",
				yellow = "#D7A65F",
				green = "#95C561",
				blue = "#7199EE",
				cyan = "#38A89D",
				purple = "#A485DD",
				grey = "#4A5057",
				special  = '#ffaf5f',
			},
		-- }}}
		--	solarized {{{
			solarized = {
				gray    = '#002b36',
				fg      = '#fdf6e3',
				black      = '#073642',
				bg   = '#002028',
				base02  = '#073642',
				red     = '#dc322f',
				green   = '#859900',
				yellow  = '#b58900',
				blue    = '#268bd2',
				purple  = '#d33682',
				cyan    = '#2aa198',
				base2   = '#eee8d5',
				base03  = '#002b36',
				orange  = '#cb4b16',
				base01  = '#586e75',
				base00  = '#657b83',
				base0   = '#839496',
				violet  = '#6c71c4',
				base1   = '#93a1a1',
				white   = '#93a1a1',
				base3   = '#fdf6e3',
				special = '#fdf6e3',
			},
		--	}}}
		--	gruvbox {{{
			gruvbox = {
				white    = '#ebdbb2',
				bg    = '#1d2021',
				black       = '#32302f',
				fg       = '#ebdbb2',
				gray     = '#928374',
				yellow   = '#fabd2f',
				cyan     = '#8ec07c',
				darkblue = '#458588',
				green    = '#b8bb26',
				orange   = '#fabd2f',
				violet   = '#d3869b',
				purple   = '#d3869b',
				blue     = '#83a598',
				red      = '#fb4934',
				special  = '#ffaf5f',
			},
		--	}}}
		-- onedark {{{
			onedark = {
				white    = '#b1b4b9',
				bg    = '#0e1013',
				black       = '#181a1f',
				fg       = '#abb2bf',
				gray     = '#5c6370',
				yellow   = '#e5c07b',
				cyan     = '#56b6c2',
				blue     = '#61afef',
				green    = '#98c379',
				orange   = '#d19a66',
				violet   = '#c678dd',
				purple   = '#c678dd',
				darkblue = '#73b8f1',
				red      = '#e86671',
				special  = '#ffaf5f',
			},
		-- }}}
			-- 256_noir {{{
			["256_noir"] = {
				white    = '#cccccc',
				bg    = '#181818',
				black       = '#232323',
				fg       = '#bbc2cf',
				gray     = '#777777',
				yellow   = '#cccccc',
				cyan     = '#cccccc',
				darkblue = '#cccccc',
				green    = '#cccccc',
				orange   = '#cccccc',
				violet   = '#cccccc',
				purple   = '#cccccc',
				blue     = '#cccccc',
				red      = '#cccccc',
				special  = '#ffaf5f',
			},
		-- }}}
			-- rose-pine {{{
			["rose-pine"] = {
				bg       = '#16141f',
				black    = '#26233a',
				fg       = '#e0def4',
				gray     = '#6e6a86',
				yellow   = '#f6c177',
				cyan     = '#ebbcba',
				green    = '#31748f',
				orange   = '#f6c177',
				purple   = '#c4a7e7',
				blue     = '#9ccfd8',
				red      = '#eb6f92',
				special  = '#ffaf5f',
			},
		-- }}}

		}
		-- }}}

		local current_theme = color_list["none"]

		if vim.g.colors_name == "vim-wal" then
			current_theme = {
				bg       = vim.g.color0,
				black    = vim.g.color0,
				fg       = vim.g.color15,
				gray     = vim.g.color8,
				yellow   = vim.g.color3,
				cyan     = vim.g.color6,
				green    = vim.g.color2,
				orange   = vim.g.color3,
				purple   = vim.g.color5,
				blue     = vim.g.color4,
				red      = vim.g.color1,
				special  = vim.g.color0,
			}
		end

		-- configs {{{
		local config = {
			options = {
				always_divide_middle = true,
				globalstatus = false,
				tabline = true,
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
			},
		}
		-- }}}

		-- special theme {{{
			config.options.theme = {
				normal = {
					a = { fg = current_theme.bg,     bg = current_theme.yellow, gui = 'bold' },
					b = { fg = current_theme.yellow, bg = current_theme.black,  gui = 'none' },
					c = { fg = current_theme.fg,     bg = current_theme.bg,     gui = 'none' },
					x = { fg = current_theme.fg,     bg = current_theme.bg,     gui = 'none' },
					y = { fg = current_theme.yellow, bg = current_theme.black,  gui = 'none' },
					z = { fg = current_theme.bg,     bg = current_theme.yellow, gui = 'bold' },
				},
				insert = {
					a = { fg = current_theme.bg,    bg = current_theme.green, gui = 'bold' },
					b = { fg = current_theme.green, bg = current_theme.black, gui = 'none' },
					c = { fg = current_theme.fg,    bg = current_theme.bg,    gui = 'none' },
					x = { fg = current_theme.fg,    bg = current_theme.bg,    gui = 'none' },
					y = { fg = current_theme.green, bg = current_theme.black, gui = 'none' },
					z = { fg = current_theme.bg,    bg = current_theme.green, gui = 'bold' },
				},
				visual = {
					a = { fg = current_theme.bg,   bg = current_theme.blue,  gui = 'bold' },
					b = { fg = current_theme.blue, bg = current_theme.black, gui = 'none' },
					c = { fg = current_theme.fg,   bg = current_theme.bg,    gui = 'none' },
					x = { fg = current_theme.fg,   bg = current_theme.bg,    gui = 'none' },
					y = { fg = current_theme.blue, bg = current_theme.black, gui = 'none' },
					z = { fg = current_theme.bg,   bg = current_theme.blue,  gui = 'bold' },
				},
				replace = {
					a = { fg = current_theme.bg,  bg = current_theme.red,   gui = 'bold' },
					b = { fg = current_theme.red, bg = current_theme.black, gui = 'none' },
					c = { fg = current_theme.fg,  bg = current_theme.bg,    gui = 'none' },
					x = { fg = current_theme.fg,  bg = current_theme.bg,    gui = 'none' },
					y = { fg = current_theme.red, bg = current_theme.black, gui = 'none' },
					z = { fg = current_theme.bg,  bg = current_theme.red,   gui = 'bold' },
				},
				command = {
					a = { fg = current_theme.bg,     bg = current_theme.purple,  gui = 'bold' },
					b = { fg = current_theme.purple, bg = current_theme.black,   gui = 'none' },
					c = { fg = current_theme.fg,     bg = current_theme.bg,      gui = 'none' },
					x = { fg = current_theme.fg,     bg = current_theme.bg,      gui = 'none' },
					y = { fg = current_theme.purple, bg = current_theme.black,   gui = 'none' },
					z = { fg = current_theme.bg,     bg = current_theme.purple,  gui = 'bold' },
				},
			}
		-- }}}

		-- aliases {{{

		-- insert {{{
		-- lualine_a
		local function botinsert_left_a(component)
			table.insert(config.sections.lualine_a, component)
		end
		-- lualine_b
		local function botinsert_left_b(component)
			table.insert(config.sections.lualine_b, component)
		end
		-- lualine_c
		local function botinsert_left_c(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- lualine_b_inactive
		local function botinsert_inact_b(component)
			table.insert(config.inactive_sections.lualine_b, component)
		end

		-- lualine_x
		local function botinsert_right_x(component)
			table.insert(config.sections.lualine_x, component)
		end
		-- lualine_y
		local function botinsert_right_y(component)
			table.insert(config.sections.lualine_y, component)
		end
		-- lualine_z
		local function botinsert_right_z(component)
			table.insert(config.sections.lualine_z, component)
		end

		-- tabline_a
		local function topinsert_left_a(component)
			table.insert(config.tabline.lualine_a, component)
		end
		-- tabline_b
		local function topinsert_left_b(component)
			table.insert(config.tabline.lualine_b, component)
		end
		-- tabline_c
		local function topinsert_left_c(component)
			table.insert(config.tabline.lualine_c, component)
		end

		-- tabline_x
		local function topinsert_right_x(component)
			table.insert(config.tabline.lualine_x, component)
		end
		-- tabline_y
		local function topinsert_right_y(component)
			table.insert(config.tabline.lualine_y, component)
		end
		-- tabline_z
		local function topinsert_right_z(component)
			table.insert(config.tabline.lualine_z, component)
		end
		-- }}}

		-- }}}

		-- compnents {{{

		-- top-line {{{

		-- icon {{{

        topinsert_left_a {
            function()
                if enable_icon == true then
                    local devicon = require("nvim-web-devicons")
                    if devicon.has_loaded() and os.getenv("TERM") ~= "Xterm" then
                        return ''
                    end
                else
                    return "git"
                end
            end,
            padding = { right = 1, left = 1 },
        }
        -- }}}

		-- git branch {{{
		topinsert_left_b {
			'branch',
			icon = '',
			-- icon = '',
		--	current_theme = { fg = current_theme.violet, gui = 'bold' },
		}
		-- }}}

		-- git-diff {{{

		topinsert_left_c {
			'diff',
			-- Is it me or the symbol for modified us really weird
			--	symbols = { added = ' ', modified = '柳', removed = ' ' },
			diff_color = {
				removed  = { fg = current_theme.red },
				modified = { fg = current_theme.cyan },
				added    = { fg = current_theme.green },
			},
			--	cond = conditions.hide_in_width,
		}
		-- }}}

		--########

		-- buffers {{{

		topinsert_right_x {
			'buffers',
			show_filename_only = true,   -- Shows shortened relative path when set to false.
			hide_filename_extension = false,   -- Hide filename extension when set to true.
			show_modified_status = false, -- Shows indicator when the buffer is modified.
			filetype_names = {
				TelescopePrompt = 'Telescope',
				dashboard = 'Dashboard',
				packer = 'Packer',
				fzf = 'FZF',
				alpha = 'Alpha',
				terminal = 'Terminal',
			}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
			symbols = {
				modified = '',      -- ● Text to show when the buffer is modified
				alternate_file = '', -- # Text to show to identify the alternate file
				directory =  '',     --  Text to show when the buffer is a directory
			},
			use_mode_color = false,

		} -- autofill char

		-- }}}

		-- diagnostics {{{
		topinsert_right_y {
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			sections = { "error", "warn", "info", "hint" },
			symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
			diagnostics_color = {
				error = { fg = current_theme.red },
				warn  = { fg = current_theme.yellow },
				info  = { fg = current_theme.cyan },
				hint  = { fg = current_theme.green },
			},
		}
		-- }}}

		-- lsp server name {{{
		topinsert_right_y {
			function()
				local msg = ''
				local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						-- return 'lsp'
						return client.name
					end
				end
				return msg
			end,
		--	icon = '',
		--	current_theme = { fg = '#ffffff', gui = 'none' },
		}
		-- }}}

		-- filetype icon {{{
		topinsert_right_z {
		function()
                if enable_icon == true then
                    local devicon = require("nvim-web-devicons")
                    local ft = vim.bo.filetype
                    -- local fn = vim.bo.filename
                    if devicon.has_loaded() and os.getenv("TERM") ~= "Xterm" then
                        local i = devicon.get_icon_by_filetype(ft, { default = true, color_icons = false })
                        return i
                    end
                else
                    return "Buf"
                end
			end,
			padding = { right = 1, left = 1 },

		}
		-- }}}

		-- }}}

		-- inactive {{{
		botinsert_inact_b { '%F' } -- base dir
		-- }}}

		-- bottom-line {{{

		-- vim icon / mode {{{
		botinsert_left_a {
			function()
                local modes = {
                    ['n' ] = 'Normal',
                    ['no'] = 'Normal·Operator Pending',
                    ['v' ] = 'Visual',
                    ['V' ] = 'V·Line',
                    [""] = 'V·Block',
                    ['s' ] = 'Select',
                    ['S' ] = 'S·Line',
                    ['^S'] = 'S·Block',
                    ['i' ] = 'Insert',
                    ['R' ] = 'Replace',
                    ['Rv'] = 'V·Replace',
                    ['c' ] = 'Command',
                    ['cv'] = 'Vim Ex',
                    ['ce'] = 'Ex',
                    ['r' ] = 'Prompt',
                    ['rm'] = 'More',
                    ['r?'] = 'Confirm',
                    ['!' ] = 'Shell',
                    ['t' ] = 'Terminal'
                }
                if enable_icon == true then
                    local devicon = require("nvim-web-devicons")
                    if devicon.has_loaded() and os.getenv("TERM") ~= "Xterm" then
                        return ""
                    end
                else
                    return modes[vim.api.nvim_get_mode()["mode"]]
				end
			end,
			padding = { right = 1, left = 1 },
		}
		-- }}}

		-- filename {{{
		botinsert_left_b {'%f'}
		-- botinsert_left_b { basename } -- base dir
		-- botinsert_left_b { 'filename' } -- filename
		-- }}}

		-- file status {{{
		botinsert_left_c {'%m %r%h%w'}
		-- }}}

		--########

		-- cursor position {{{
		botinsert_right_x {'%l, %L, %c'}
		-- }}}

		-- filetype {{{
		botinsert_right_y {
		function()
				local ft = vim.bo.filetype
				if ft == '' then
					return 'None'
				elseif ft == "toggleterm" then
					return "Terminal"
				else
					return ft
				end
			end
		}
		-- }}}

		-- fileformat {{{
		botinsert_right_z {
			function()
				local ff = string.format("%s", vim.bo.fileformat)
				local icon = {
					unix = '', -- e712
					dos = '',  -- e70f
					mac = '',  -- e711
				}
				local text = {

					unix = 'LF',
					mac  = 'CR',
					dos  = 'LFCR',

					-- unix = 'U',
					-- mac  = 'M',
					-- dos  = 'D',

					-- unix = 'Unix',
					-- mac  = 'Mac',
					-- dos  = 'Dos',

				}

                if enable_icon == true then
                    local devicon = require("nvim-web-devicons")
                    if devicon.has_loaded() and os.getenv("TERM") ~= "Xterm" then
                        return icon[ff]
                    end
                else
                    return text[ff]
				end
			end
		}
		-- }}}

		-- }}}

		-- }}}

		-- separators {{{
		local separators = {
			none        = { left = '',   right = ''   },
			single      = { left = '›',  right = '‹'  },
			double      = { left = '»',  right = '«'  },
			long        = { left = '⟩',  right = '⟨'  },
			ascii       = { left = '>',  right = '<'  },
			sharp       = { left = '',  right = ''  },
			lift        = { left = '',  right = ' '  },
			round       = { left = "",  right = ""  },
			block       = { left = "█",  right = "█"  },
			pipe        = { left = '|',  right = '|'  },
			brokenpipe  = { left = '¦',  right = '¦'  },
			dash        = { left = '-',  right = '-'  },
			endash      = { left = '–',  right = '–'  },
			emdash      = { left = '—',  right = '—'  },
			arrow       = { left = '→',  right = '←'  },
			arrowduoble = { left = '⇒',  right = '⇐'  },
			slash       = { left = '/',  right = '/'  },
			backslash   = { left = '\\', right = '\\' },
			equal       = { left = '=',  right = '='  },
		}

        if enable_icon == true then
            local devicon = require("nvim-web-devicons")
            if devicon.has_loaded() and os.getenv("TERM") ~= "Xterm" then
                config.options.section_separators = separators.lift
                config.options.component_separators = separators.single
            end
        else
            config.options.section_separators = separators.none
            config.options.component_separators = separators.ascii
		end

        if os.getenv("TERM") == "xterm-256color" then
            config.options.section_separators = separators.none
            config.options.component_separators = separators.ascii
		end
		-- }}}

		require('lualine').setup(config)

	end
}
