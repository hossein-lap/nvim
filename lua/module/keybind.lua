-- helper {{{
---- map {{{
--
-----@param map string set keybinding using nvim's Lua API
--local function map(mode, key, command, opts)
--	local options = {}
--	if opts then
--		options = vim.tbl_extend("force", options, opts)
--	end
--	vim.api.nvim_set_keymap(mode, key, command, options)
--end
---- }}}
---- umap {{{
--local function umap(mode, key)
--	if not mode or not key then
--		vim.notify('umap(mode, key) must have at least two arguments', 4,
--			{title = 'Error on using umap()'})
--		return 1
--	end
--	vim.api.nvim_del_keymap(mode, key)
--end
---- }}}
-- au {{{
local function au(commands, patterns, evnt)
	if evnt == nil then
		evnt = 'FileType'
	end
	vim.api.nvim_create_autocmd(evnt, {
		pattern = patterns,
		command = commands,
--		group = patterns .. 'groups'
	})
end
-- }}}
-- }}}

---- folding {{{
--map('n', '<leader>da', ':mkview<CR>', { noremap = true, desc = "Save folds" })
--map('n', '<leader>dw', ':loadview<CR>', { noremap = true, desc = "Load folds" })
---- }}}
-- back to normal-mode in terminal {{{
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = "Exit insert mode in Terminal" })
--map('t', '<C-d>', '<C-c><C-c> <space> exit<CR>',
--		{ silent = true, noremap = true, desc = "Exit Terminal" })
-- }}}
-- back to normal mode {{{
vim.keymap.set('i', '<C-c>', '<Esc>', {noremap = true, desc = "Exit insert mode"})
-- }}}
-- delete without changing what register contains {{{
vim.keymap.set('x', '<localleader>p', '"_dP')

vim.keymap.set('v', '<localleader>y', '"+y')
vim.keymap.set('n', '<localleader>y', '"+y')
vim.keymap.set('n', '<localleader>Y', '"+Y')

vim.keymap.set('v', '<localleader>d', '"_d')
vim.keymap.set('n', '<localleader>d', '"_d')
-- }}}
-- toggle paste mode {{{
PasteModeEnable = 0
function tmpNotify()
	if PasteModeEnable == 1 then
		PasteModeEnable = 0 -- it's off
		vim.notify("paste mode enabled", 2)
	else
		PasteModeEnable = 1 -- it's on
		vim.notify("paste mode disabled", 2)
	end
end
vim.keymap.set('n', '<C-P>', ':set paste! nu! list!<CR>:lua <CR>',
		{ silent = true, noremap = true, desc = "Toggle › paste mode, disable decorations" })
-- }}}
-- spelling check {{{
vim.keymap.set('n', '<leader>ss',  ':set spell!<CR>',
		{ silent = true, noremap = true, desc = "Toggle › spell check" })
-- }}}
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- move line down in visual mode
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") -- move line up in visual mode
vim.keymap.set('n', 'J', 'mzJ`z') -- append lines
vim.keymap.set('n', '<C-d>', '<C-d>zz') -- half-page down on the mid-page
vim.keymap.set('n', '<C-u>', '<C-u>zz') -- half-page up on the mid-page
vim.keymap.set('n', 'n', 'nzzzv') -- keep search on the mid-page
vim.keymap.set('n', 'N', 'Nzzzv') -- keep search on the mid-page
vim.keymap.set('n', 'Q', '<nop>') -- no ex-mode
-- quickfix navs
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<localleader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<localleader>j', '<cmd>lprev<CR>zz')
vim.keymap.set('n', '<localleader>s', ':%s/\\<<C-r><C-w>\\>/<<C-r><C-w>/gI<Left><Left><Left>')
-- go to next/previous buffer {{{
vim.keymap.set('n', '<C-n>',  ':bnext<CR>',
		{ silent = true, noremap = true, desc = "Next buffer" })
vim.keymap.set('n', '<C-b>',  ':bprevious<CR>',
		{ silent = true, noremap = true, desc = "Previous buffer" })
-- }}}
---- switch tabs {{{
--map('n', '_', ':tabnext<CR>',
--		{ silent = true, noremap = true, desc = "Next file in tab" })
---- }}}
-- comment lines via - and uncomment via + {{{
-- comment_leader var definition {{{
au( [[let b:comment_leader = '//']],
	{ 'c', 'cpp', 'java', 'scala', 'json', 'rust', 'go' })

au( [[let b:comment_leader = '#']],
	{ 'sh', 'zsh', 'csh', 'ruby', 'python', 'conf', 'yaml', 'make', 'toml', 'rmd', 'sent' })

au( [[let b:comment_leader = '--']],
	{ 'haskell', 'lua', })

au( [[let b:comment_leader = '"']],
	{ 'vim', })

au( [[let b:comment_leader = '%']],
	{ 'tex', 'plaintex', })

au( [[let b:comment_leader = '.\"']],
	{ 'nroff', })

au( [[let b:comment_leader = ';']],
	{ 'asm', 'lisp' })
-- }}}

-- noremap <silent> - :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
-- noremap <silent> + :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

-- keybinding
vim.keymap.set('', '<leader>1',
	[[:<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>]],
	{ silent = true, noremap = true, desc = "Comment line(s) - no indent" })
vim.keymap.set('', '<leader>2',
	[[:<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>]],
	{ silent = true, noremap = true, desc = "Uncomment line(s) - no indent" })

vim.keymap.set('', '<localleader>1',
	[[:s=\v^(\s*)=\1<C-R>=escape(b:comment_leader,'\ ')<CR><CR>:nohlsearch<CR>]],
	{ silent = true, noremap = true, desc = "Comment line(s) - with indent" })
vim.keymap.set('', '<localleader>2',
	[[:s=\v^(\s*)\<C-R>=escape(b:comment_leader,'\= ')<CR>=\1=<CR>:nohlsearch<CR>]],
	{ silent = true, noremap = true, desc = "Uncomment line(s) - with indent" })

-- }}}
-- autofill {{{
vim.keymap.set('n', '<leader>aa', ':lua AutoFill()<CR>',
		{ silent = true, noremap = true, desc = "Toggle autofill (all)" })
vim.keymap.set('n', '<leader>af', ':lua AutoFillToggle()<CR>',
		{ silent = true, noremap = true, desc = "Toggle basic autofill" })
vim.keymap.set('n', '<leader>ad', ':lua AutoFillMarkdownToggle()<CR>',
		{ silent = true, noremap = true, desc = "Toggle markdown autofill" })
vim.keymap.set('n', '<leader>as', ':lua AutoFillSentToggle()<CR>',
		{ silent = true, noremap = true, desc = "Toggle sent autofill" })
-- }}}
