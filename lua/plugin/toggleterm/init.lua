local Term  = require('toggleterm.terminal').Terminal

local width = math.floor(vim.api.nvim_get_option("columns") / 2)
local height = math.floor(vim.api.nvim_get_option("lines") / 2)
local xpad = (width * 2) - math.floor(vim.api.nvim_get_option("columns") / 8)
local ypad = (height * 2) - math.floor(vim.api.nvim_get_option("lines") / 5)

require'toggleterm'.setup {
	size = function(term)
			if term.direction == "horizontal" then
				return height
			elseif term.direction == "vertical" then
				return width
			end
		end,

	winbar = {
		enabled = true,
		name_formatter = function(Terminal) --  term: Terminal
			return Terminal.name
		end
	},

	highlights = {
		Normal = {
			guibg = 'NONE',
		},
		NormalFloat = {
			link = 'Normal'
		},
		FloatBorder = {
			link = 'Number',
--			guifg = "#ff7777",
--			guifg = "#77ff77",
		},
	},

	direction = 'float',
	float_opts = {
		border = 'curved',
		winblend = 0,
		width  = xpad,
		height = ypad,
		zindex = 50,
	},

	shell = 'bash',
	open_mapping = [[<C-q>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_terminals = true,
	start_in_insert = true,
	close_on_exit = false,
}

-- custom terminals {{{
-- horizontal terminal
function TermH(wrapand)
	local theterm = Term:new({
		direction = 'horizontal',
		cmd = wrapand,
	})
	theterm:toggle()
end

-- vertical terminal
function TermV(wrapand)
	local theterm = Term:new({
		direction = 'vertical',
		cmd = wrapand,
	})
	theterm:toggle()
end

-- float terminal
function TermF(wrapand)
	local theterm = Term:new({
		direction = 'float',
		cmd = wrapand,
		size = 0.1,
	})
	theterm:toggle()
end
-- }}}
-- Term Wrapper {{{
function TermW(type)
	local src_name = vim.fn.expand('%')
	local out_name = vim.fn.expand('%:r')
	local filetype = vim.bo.filetype

	-- command tables {{{
	local command = {
		-- run {{{
		run = {
			c = './' .. out_name,
			cpp = './' .. out_name,
			rust = './' .. out_name,
			go = 'go run ' .. src_name,
			python = './' .. src_name,
			lua = './' .. src_name,
			sh = './' .. src_name,
			csh = './' .. src_name,
			zsh = './' .. src_name,
			sent = 'sent ' .. src_name,
			text = 'sent ' .. src_name,
			markdown = string.format('pandoc %s %s -o %s.pdf',
				pandoc_path, src_name, out_name),
			nroff = string.format('groff %s %s > %s.pdf',
				src_name, '-m me -keUs -Tpdf', out_name), -- -egGjkpRstU
			rmd = string.format("%s = '%s', %s",
				'Rscript -e "rmarkdown::render(input', src_name,
				'output_format = \\"md_document\\")"'),
		},
		-- }}}
		-- compile {{{
		compile = {
			c = string.format('gcc -Wall %s -o %s', src_name, out_name),
			cpp = string.format('g++ -Wall %s -o %s', src_name, out_name),
			rust = 'rustc ' .. src_name,
			go = 'go build ' .. src_name,
			python = 'python ' .. src_name,
			lua = 'lua5.4 ' .. src_name,
			sh = 'bash ' .. src_name,
			csh = 'csh ' .. src_name,
			zsh = 'zsh ' .. src_name,
--			nroff = string.format('pdfroff -U -mspdf %s > %s.pdf',
--				src_name, out_name),
			nroff = string.format('groff %s %s > %s.pdf',
				src_name, '-mspdf -keUs -Tpdf', out_name), -- -egGjkpRstU
			tex = 'xelatex ' .. src_name,
			sent = 'sent -i ' .. src_name,
			text = 'sent -i ' .. src_name,
			markdown = string.format('pandoc --defaults %s %s -o %s.pdf',
				pandoc_path, src_name, out_name),
			rmd = string.format([[%s(input='%s', %s, params='%s')"]],
				[[Rscript -e "rmarkdown::render]], src_name,
				[[output_format = 'all']], pandoc_path),
		},
		-- }}}
		-- extra {{{
		extra = {
			c = string.format('gcc %s -o debug-%s -g && gdb ./debug-%s',
				src_name, out_name, out_name),
			sent = "sent -f 'Source Sans Pro' " .. src_name,
			text = "sent -f 'Source Sans Pro' " .. src_name,
			tex = 'xelatex -interaction=nonstopmode -synctex=1 ' .. src_name,
			markdown = string.format('pandoc %s%s%s %s -o %s.pdf ',
				'--defaults ~/.config/pandoc/defaults/beamer/',
				Pandoc_beamer_default, '.yaml', src_name, out_name),
		},
		-- }}}
	}
	-- }}}

	if command[type][filetype] == nil then
		vim.notify("No command is set", 2, {title = {TermW()}})
		return 17
	end

	TermH(command[type][filetype])
end
-- }}}

vim.keymap.set('n', '<leader>f1', ":lua TermW('run')<CR>")
vim.keymap.set('n', '<leader>f2', ":lua TermW('compile')<CR>")
vim.keymap.set('n', '<leader>f3', ":lua TermW('extra')<CR>")
vim.keymap.set('n', '<leader>ts', ':lua TermF("bash")<CR>')
vim.keymap.set('n', '<leader>tv', ':lua TermV("dash %")<CR>')
vim.keymap.set('n', '<leader>th', ':lua TermH(string.format("echo %s", vim.bo.file))<CR>')
