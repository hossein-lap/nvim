-- Shout out to primeagen --
-- list of schemes {{{
-- rosepine
-- ayu
-- solarized
-- dracula
-- tokyodark

-- tokyonight

-- nightfox
-- catppuccin
-- nord
-- material
-- onedark

-- hybrid_material sunbather dalton tokyodark
-- solarized material nord onedark
--
-- hybrid

-- 256_noir -- red
-- paramount -- purple
-- sunbather -- pink
-- lupper -- blue
-- octave -- orange

-- blud -- red
-- hos -- colorful
-- }}}

---set colorscheme with or without transparency
---@param color string name on the colorscheme
---@param alpha int set it nil to disable alpha
--- • default colorscheme is `ayu-dark`
function ColorThem(color, alpha)
--	if alpha == nil or alpha == '' or alpha == false then
--		alpha = 0
--	end

	alpha = alpha or AlphaEnable

	local defaultcolor = 'ayu-dark'
	if color == nil or color == '' then
		color = defaultcolor
	end

--	local term = os.getenv("TERM")
--	if term ~= 'st-256color' or term ~= 'xterm-256color' then
--		local options = {
--			termguicolors = true,
--		}
--
--		for key,value in pairs(options) do
--			vim.o[key] = value
--		end
--	else
--		local options = {
--			termguicolors = false,
--		}
--
--		for key,value in pairs(options) do
--			vim.o[key] = value
--		end
--
--		color = 'default'
--	end

	local schemestatus = pcall(vim.cmd.colorscheme, color)
	if schemestatus == false then
		vim.notify(string.format('%s: %s\n%s: %s', 'Colorscheme not found',
			            color, 'Fallback scheme', defaultcolor), 3,
			            { title = 'ColorThem()' })
		color = defaultcolor

		if pcall(vim.cmd.colorscheme, color) == false then
			vim.notify(string.format('%s: %s\n%s', 'Also not found',
						color, 'Falling back to default'), 3,
						{ title = 'ColorThem()' })
			color = 'default'
		end
	else
		if defaultcolor == 'ayu-dark' then
			local colors = require('ayu.colors')
			require('ayu').setup({
				overrides = function()
					return { Comment = { fg = colors.comment } }
				end
			})
		end
	end

	vim.cmd.colorscheme(color)

	if color == 'onedark' then
		require('onedark').setup {
			style = 'darker'
		}
		require('onedark').load()
	end

	if alpha ~= 0 then
		local sections = {
			'Normal',
			'NormalFloat',
			'SignColumn',
			'WhichKeyFloat',
			'VertSplit',
			-- 'TabLineSel',
			-- 'FoldColumn',
			-- 'Folded',
		}

		for i = 1, #sections do
			vim.api.nvim_set_hl(0, sections[i], {bg = 'none'})
		end

		vim.g.terminal_color_0 = 'none'
		vim.g.terminal_color_background = 'none'
	end
end

-- -- term color {{{
-- local termcolor = 'solarized'
--
-- if termcolor == 'dracula' then
-- 	vim.g.terminal_color_0  = "#21222c"
-- 	vim.g.terminal_color_1  = "#ff5555"
-- 	vim.g.terminal_color_2  = "#50fa7b"
-- 	vim.g.terminal_color_3  = "#f1fa8c"
-- 	vim.g.terminal_color_4  = "#bd93f9"
-- 	vim.g.terminal_color_5  = "#ff79c6"
-- 	vim.g.terminal_color_6  = "#8be9fd"
-- 	vim.g.terminal_color_7  = "#bbbbbb"
-- 	vim.g.terminal_color_8  = "#6272a4"
-- 	vim.g.terminal_color_9  = "#ff6e6e"
-- 	vim.g.terminal_color_10 = "#69ff94"
-- 	vim.g.terminal_color_11 = "#ffffa5"
-- 	vim.g.terminal_color_12 = "#d6acff"
-- 	vim.g.terminal_color_13 = "#ff92df"
-- 	vim.g.terminal_color_14 = "#a4ffff"
-- 	vim.g.terminal_color_15 = "#ffffff"
-- elseif termcolor == 'solarized' then
-- 	vim.g.terminal_color_0  = "#073642"
-- 	vim.g.terminal_color_1  = "#dc322f"
-- 	vim.g.terminal_color_2  = "#859900"
-- 	vim.g.terminal_color_3  = "#b58900"
-- 	vim.g.terminal_color_4  = "#268bd2"
-- 	vim.g.terminal_color_5  = "#d33682"
-- 	vim.g.terminal_color_6  = "#2aa198"
-- 	vim.g.terminal_color_7  = "#eee8d5"
-- 	vim.g.terminal_color_8  = "#002b36"
-- 	vim.g.terminal_color_9  = "#cb4b16"
-- 	vim.g.terminal_color_10 = "#586e75"
-- 	vim.g.terminal_color_11 = "#657b83"
-- 	vim.g.terminal_color_12 = "#839496"
-- 	vim.g.terminal_color_13 = "#6c71c4"
-- 	vim.g.terminal_color_14 = "#93a1a1"
-- 	vim.g.terminal_color_15 = "#fdf6e3"
-- elseif termcolor == 'tango' then
-- 	vim.g.terminal_color_0  = "#2e3436"
-- 	vim.g.terminal_color_1  = "#cc0000"
-- 	vim.g.terminal_color_2  = "#4e9a06"
-- 	vim.g.terminal_color_3  = "#c4a000"
-- 	vim.g.terminal_color_4  = "#3465a4"
-- 	vim.g.terminal_color_5  = "#75507b"
-- 	vim.g.terminal_color_6  = "#06989a"
-- 	vim.g.terminal_color_7  = "#d3d7cf"
-- 	vim.g.terminal_color_8  = "#555753"
-- 	vim.g.terminal_color_9  = "#ef2929"
-- 	vim.g.terminal_color_10 = "#8ae234"
-- 	vim.g.terminal_color_11 = "#fce94f"
-- 	vim.g.terminal_color_12 = "#729fcf"
-- 	vim.g.terminal_color_13 = "#ad7fa8"
-- 	vim.g.terminal_color_14 = "#34e2e2"
-- 	vim.g.terminal_color_15 = "#eeeeec"
-- elseif termcolor == 'breeze' then
-- 	vim.g.terminal_color_0  = "#232627"
-- 	vim.g.terminal_color_1  = "#ed1515"
-- 	vim.g.terminal_color_2  = "#11d116"
-- 	vim.g.terminal_color_3  = "#f67400"
-- 	vim.g.terminal_color_4  = "#1d99f3"
-- 	vim.g.terminal_color_5  = "#9b59b6"
-- 	vim.g.terminal_color_6  = "#1abc9c"
-- 	vim.g.terminal_color_7  = "#fcfcfc"
-- 	vim.g.terminal_color_8  = "#7f8c8d"
-- 	vim.g.terminal_color_9  = "#c0392b"
-- 	vim.g.terminal_color_10 = "#1cdc9a"
-- 	vim.g.terminal_color_11 = "#fdbc4b"
-- 	vim.g.terminal_color_12 = "#3daee9"
-- 	vim.g.terminal_color_13 = "#8e44ad"
-- 	vim.g.terminal_color_14 = "#16a085"
-- 	vim.g.terminal_color_15 = "#ffffff"
-- elseif termcolor == 'vscode' then
-- 	vim.g.terminal_color_0 = "#000000"
-- 	vim.g.terminal_color_1 = "#cd3131"
-- 	vim.g.terminal_color_2 = "#0dbc79"
-- 	vim.g.terminal_color_3 = "#e5e510"
-- 	vim.g.terminal_color_4 = "#2472c8"
-- 	vim.g.terminal_color_5 = "#bc3fbc"
-- 	vim.g.terminal_color_6 = "#11a8cd"
-- 	vim.g.terminal_color_7 = "#e5e5e5"
-- 	vim.g.terminal_color_8 = "#666666"
-- 	vim.g.terminal_color_9 = "#f14c4c"
-- 	vim.g.terminal_color_10 = "#50fa7b"
-- 	vim.g.terminal_color_11 = "#f1fa8c"
-- 	vim.g.terminal_color_12 = "#3b8eea"
-- 	vim.g.terminal_color_13 = "#d670d6"
-- 	vim.g.terminal_color_14 = "#29b8db"
-- 	vim.g.terminal_color_15 = "#e5e5e5"
-- end
--
-- --local terminal_color_background	 = "#002b36"
-- --local terminal_color_foreground	 = "#cccccc"
-- --
-- --vim.cmd [[highlight FloatBorder guibg='#002b36' guifg='#cccccc']]
-- -- }}}

ColorThem(CurrentColorscheme, AlphaEnable)
