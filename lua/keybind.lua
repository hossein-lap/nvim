-- netrw toggle
map('n', '<leader>ff', ':24Lexplore<CR><C-w>w')

-- toggle paste mode
map('n', '<C-P>', ':set paste!<CR>')

-- spelling check
map('n', '<leader>ss',  ':setlocal spell!<CR>', {silent = true})

-- clear search highlight
map('n', '<C-n>',  ':set nohlsearch<CR>', {silent = true})

-- switch tabs
map('n', '_', ':tabprevious<CR>', {silent = true})

-- comment lines via - and uncomment via +
au({ 'c', 'cpp', 'java', 'scala', 'json', 'rust' },
	[[let b:comment_leader = '//']])
au({ 'sh', 'ruby', 'python', 'conf', 'yaml', 'make', 'toml', 'rmd' },
	[[let b:comment_leader = '#']])
au({ 'haskell', 'lua', },
	[[let b:comment_leader = '--']])
au({ 'vim', },
	[[let b:comment_leader = '"']])
au({ 'tex', 'plaintex', },
	[[let b:comment_leader = '%']])
au({ 'nroff', },
	[[let b:comment_leader = '\"']])

au({ 'asm', },
	[[let b:comment_leader = ';']])

-- cmd 'let'

-- map the keybinding
map('',
	'-',
	[[:s;\v^(\s*);\1<C-R>=escape(b:comment_leader,'\ ')<CR><CR>:nohlsearch<CR>]],
	{ silent = true }
)

-- map('',
	-- '+',
	-- [[:s;\v^(\s*)\<C-R>=escape(b:comment_leader,'\; ')<CR>;\1;<CR>:nohlsearch<CR>]],
	-- { silent = true }
-- )


cmd [[
"noremap <silent> - :<C-B>silent <C-E>s;\v^(\s*);\1<C-R>=escape(b:comment_leader,'\ ')<CR><CR>:nohlsearch<CR>
noremap <silent> + :<C-B>silent <C-E>s;\v^(\s*)\<C-R>=escape(b:comment_leader,'\; ')<CR>;\1;<CR>:nohlsearch<CR>
]]
