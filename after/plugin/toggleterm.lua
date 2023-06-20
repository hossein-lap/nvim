local Term  = require('toggleterm.terminal').Terminal

-- keymap function {{{
local function map(mode, key, command, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, key, command, options)
end
-- }}}

local width = vim.api.nvim_get_option("columns") / 2
local height = vim.api.nvim_get_option("lines") / 2

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
		FloatBorder = {
			guifg = "#ff7777",
		},
	},

	direction = 'float',
	float_opts = {
		border = 'curved',
		winblend = 1,
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

	print(command[type][filetype])
end
-- }}}

map('n', '<leader>ft', ":lua TermW('run')<CR>")
map('n', '<leader>tt', ':lua TermF("bash")<CR>')
map('n', '<leader>tv', ':lua TermV("dash %")<CR>')
map('n', '<leader>th', ':lua TermH("file vim.bo.file")<CR>')
