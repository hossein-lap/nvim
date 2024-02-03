-- helpers

local lsp_server = function()
	local msg = ''
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
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
end

-- vim.cmd [[
-- 	set showtabline=2
-- 	set tabline=%!MyTabLine()  " custom tab pages line
--
-- 	function MyTabLine()
-- 		let s = ''
-- 		for i in range(tabpagenr('$'))
-- 			" select the highlighting
-- 			if i + 1 == tabpagenr()
-- 				let s ..= '%#TabLineSel#'
-- 			else
-- 				let s ..= '%#TabLine#'
-- 			endif
--
-- 			" set the tab page number (for mouse clicks)
-- 			let s ..= '%' .. (i + 1) .. 'T'
--
-- 			" " the label is made by MyTabLabel()
-- 			" let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
-- 		endfor
--
-- 		" after the last tab fill with TabLineFill and reset tab page nr
-- 		let s ..= '%#TabLineFill#%T'
--
-- 		" right-align the label to close the current tab page
-- 		if tabpagenr('$') > 1
-- 			let s ..= '%=%#TabLine#%999Xclose'
-- 		endif
--
-- 		return s
-- 	endfunction
-- ]]

local lsp_diag = function ()

end

-- show status line
vim.opt.laststatus = 2
vim.opt.showtabline = 2

-- status line config
vim.opt.statusline = " %f %m %r%h%w %= %c %l:%L       %P "..string.format(' %s %s', vim.bo.filetype, lsp_server())
vim.opt.tabline = string.format('%s', lsp_server())
