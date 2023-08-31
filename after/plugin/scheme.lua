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

ColorThem(CurrentColorscheme, AlphaEnable)
