-- autocmds {{{
au({ 'c', 'make', 'asm' }, "set noexpandtab" )
au({ 'c', 'make', 'asm' }, "set tabstop=8" )
au({ 'c', 'make', 'asm' }, "set softtabstop=8" )
au({ 'c', 'make', 'asm' }, "set shiftwidth=8" )
au({ 'asm' }, "syntax=nasm" )

au({ 'python', 'toml', 'yaml', 'nim', }, "set expandtab" )
au({ 'python', 'toml', 'yaml', 'nim', }, "set tabstop=4" )
au({ 'python', 'toml', 'yaml', 'nim', }, "set softtabstop=4" )
au({ 'python', 'toml', 'yaml', 'nim', }, "set shiftwidth=4" )

au({ 'plaintex', }, "set filetype=tex")

au({ 'markdown', 'rmd' }, ':silent lua AutoFillMarkdown()')

au({ 'c', 'cpp', 'python', 'lua', 'sh', 'make' },
	':silent lua AutoFill()'
)
-- }}}

-- global autofill function {{{
Autofill = 0
function AutoFill()
	if Autofill == 0 then
		Autofill = 1
		map('i', '"', '""<Left>')
		map("i", "'", "''<Left>")
		map('i', '`', '``<Left>')
		map('i', '(', '()<Left>')
		map('i', '[', '[]<Left>')
		map('i', '{', '{}<Left>')
		print("[AutoFill() Enabled]")
	else
		Autofill = 0
		umap('i', '"')
		umap("i", "'")
		umap('i', '`')
		umap('i', '(')
		umap('i', '[')
		umap('i', '{')
		print("[AutoFill() Disabled]")
	end
end
-- }}}
-- markdown autofill function {{{
Mautofill = 0
function AutoFillMarkdown()
	if Mautofill == 0 then
		Mautofill = 1
		map('i', '*', '**<Left>')
		map('i', '_', '__<Left>')
		print('[md autofill Enabled]')
	else
		Mautofill = 0
		umap('i', '*')
		umap('i', '_')
		print('[md autofill Disabled]')
	end
end
-- }}}

map('n', '<leader>af', ':lua AutoFill()<CR>')
map('n', '<leader>am', ':lua AutoFillMarkdown()<CR>')
--map('n', '<leader>ac', ':lua AsciiChars()<CR>')
