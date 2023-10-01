local bufferline = require('bufferline')
bufferline.setup {
	options = {
		mode = 'buffers',
		-- mode = 'tabs',
		-- offsets = {
		-- 	{
		-- 		filetype = "netrw",
		-- 		text = "Netrw", -- | function
		-- 		text_align = "center",
		-- 		separator = true,
		-- 	},
		-- 	{
		-- 		filetype = "NvimTree",
		-- 		text = "NvimTree", -- | function
		-- 		text_align = "center",
		-- 		separator = true,
		-- 	},
		-- },
		show_buffer_close_icons = false,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		separator_style = {'', ''},
		indicator = {
			icon = '',
			style = 'none',
		},
		show_tab_indicators = false ,
		tab_size = 2,

		custom_areas = {
			right = function()
				local result = {}
				-- local seve = vim.diagnostic.severity
				-- local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
				-- local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
				-- local info = #vim.diagnostic.get(0, {severity = seve.INFO})
				-- local hint = #vim.diagnostic.get(0, {severity = seve.HINT})
				local vimlogo = " "
				local lead = " "

				-- if error ~= 0 then
				-- 	table.insert(result, {text = "x"..error..lead, fg = "#EC5241"})
				-- end
				--
				-- if warning ~= 0 then
				-- 	table.insert(result, {text = "!"..warning..lead, fg = "#EFB839"})
				-- end
				--
				-- if hint ~= 0 then
				-- 	table.insert(result, {text = "*"..hint..lead, fg = "#A3BA5E"})
				-- end
				--
				-- if info ~= 0 then
				-- 	table.insert(result, {text = "?"..info..lead, fg = "#7EA9A7"})
				-- end

				table.insert(result, {text = vimlogo..lead, fg = "#b5bd68"})
				return result
			end,
			left = function()
				local result = {}
				local fbsdlogo = "  "
				local lead = " "
				table.insert(result, {text = fbsdlogo..lead, fg = "#cc6666"})
				return result
			end
		}
	},
}
