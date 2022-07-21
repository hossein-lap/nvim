-- netrw toggle
--map('n', '<leader>ff', ':24Lexplore<CR><C-w>w')

map('n', '<leader>ff', ':lua NTToggle()<CR>', {silent = true})

-- toggle paste mode
map('n', '<C-P>', ':set paste!<CR>')

-- spelling check
map('n', '<leader>ss',  ':setlocal spell!<CR>', {silent = true})

-- NvimTree Toggle
map('n', '<leader>ss',  ':setlocal spell!<CR>', {silent = true})

-- clear search highlight
map('n', '<C-n>',  ':set nohlsearch<CR>', {silent = true})

-- switch tabs
map('n', '_', ':tabprevious<CR>', {silent = true})

-- comment lines via - and uncomment via + {{{
-- comment_leader var definition {{{
au( [[let b:comment_leader = '//']],
	{ 'c', 'cpp', 'java', 'scala', 'json', 'rust' })

au( [[let b:comment_leader = '#']],
	{ 'sh', 'ruby', 'python', 'conf', 'yaml', 'make', 'toml', 'rmd' })

au( [[let b:comment_leader = '--']],
	{ 'haskell', 'lua', })

au( [[let b:comment_leader = '"']],
	{ 'vim', })

au( [[let b:comment_leader = '%']],
	{ 'tex', 'plaintex', })

au( [[let b:comment_leader = '\"']],
	{ 'nroff', })

au( [[let b:comment_leader = ';']],
	{ 'asm', })
-- }}}
-- keybinding
map('', '-',
	[[:s;\v^(\s*);\1<C-R>=escape(b:comment_leader,'\ ')<CR><CR>:nohlsearch<CR>]],
	{ silent = true }
)

map('', '+',
	 [[:s;\v^(\s*)\<C-R>=escape(b:comment_leader,'\; ')<CR>;\1;<CR>:nohlsearch<CR>]],
	 { silent = true }
)
-- }}}

-- Compile/Run keymaps {{{
map('n', '<leader>fe', RunnerCMD, { silent = true })
map('n', '<leader>fw', CompilerCMD, { silent = true })
map('n', '<leader>fq', DebugCMD, { silent = true })

-- makefile
map('n', '<leader>cc', ':lua Terminal("make")<CR>', { silent = true })
-- }}}

