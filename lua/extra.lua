-- autocmds {{{
au( "set noexpandtab",        { 'c', 'make', 'nasm' })
au( "set tabstop=8",        { 'c', 'make', 'nasm' })
au( "set softtabstop=8",    { 'c', 'make', 'nasm' })
au( "set shiftwidth=8",        { 'c', 'make', 'nasm' })

au( "set expandtab",        { 'python', 'toml', 'yaml', 'nvim', 'markdown', 'rmd' })
au( "set tabstop=4",        { 'python', 'toml', 'yaml', 'nvim', 'markdown', 'rmd' })
au( "set softtabstop=4",    { 'python', 'toml', 'yaml', 'nvim', 'markdown', 'rmd' })
au( "set shiftwidth=4",        { 'python', 'toml', 'yaml', 'nvim', 'markdown', 'rmd' })

au( "set filetype=tex", { 'plaintex' })

au( ":silent lua AutoFillMarkdown()", { 'markdown', 'rmd' })

au( ":silent lua AutoFill()", { 'c', 'cpp', 'python', 'lua', 'sh', 'make', 'tex' })
----
au( "set filetype=c", {'*.h'}, {'BufRead', 'BufNewFile'} )

au( "set filetype=nasm", {'*.s', '*.asm'}, {'BufRead', 'BufNewFile'} )

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
