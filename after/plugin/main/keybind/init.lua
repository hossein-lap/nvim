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

-- -- au {{{
-- local function au(commands, patterns, evnt)
-- 	if evnt == nil then
-- 		evnt = 'FileType'
-- 	end
-- 	vim.api.nvim_create_autocmd(evnt, {
-- 		pattern = patterns,
-- 		command = commands,
-- --		group = patterns .. 'groups'
-- 	})
-- end
-- -- }}}

-- }}}


---- folding {{{
--map('n', '<localleader>da', ':mkview<CR>', { noremap = true, desc = "Save folds" })
--map('n', '<localleader>dw', ':loadview<CR>', { noremap = true, desc = "Load folds" })
---- }}}

-- back to normal-mode in terminal {{{
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = "Exit insert mode in Terminal" })
--map('t', '<C-d>', '<C-c><C-c> <space> exit<CR>',
--		{ silent = true, noremap = true, desc = "Exit Terminal" })
-- }}}

-- back to normal mode {{{
vim.keymap.set('i', '<C-c>', '<Esc>', {noremap = true, desc = "Exit insert mode"})
-- }}}

-- to xclip / delete without changing what register contains {{{
vim.keymap.set('x', '<leader>p', '\"_dP', {})
vim.keymap.set('n', '<leader>P', '\"+p', {})

vim.keymap.set('v', '<leader>y', '\"+y', {})
vim.keymap.set('n', '<leader>y', '\"+Y', {})

vim.keymap.set('n', '<leader>d', '\"_d', {})
vim.keymap.set('v', '<leader>d', '\"_d', {})
-- }}}

---- toggle paste mode {{{
--PasteModeEnable = 0
--function tmpNotify()
--	if PasteModeEnable == 1 then
--		PasteModeEnable = 0 -- it's off
--		vim.notify("paste mode enabled", 2)
--	else
--		PasteModeEnable = 1 -- it's on
--		vim.notify("paste mode disabled", 2)
--	end
--end
--vim.keymap.set('n', '<C-P>', ':set paste! nu! rnu! list!<CR>:lua <CR>',
--		{ silent = true, noremap = true, desc = "Toggle › paste mode, disable decorations" })
---- }}}

-- spelling check {{{
vim.keymap.set('n', '<localleader>ss',  ':set spell!<CR>',
		{ silent = true, noremap = true, desc = "Toggle › spell check" })
-- }}}

vim.keymap.set('n', '<leader>wr', ":set wrap!<CR>",
	{silent = false, desc = 'toggle line wrapping'})

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv",
	{silent = false, desc = 'move line down in visual mode'})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv",
	{silent = false, desc = 'move line up in visual mode'})
vim.keymap.set('n', 'J', 'mzJ`z',
	{silent = false, desc = 'append lines'})
vim.keymap.set('n', '<C-d>', '<C-d>zz',
	{silent = false, desc = 'half-page down on the mid-page'})
vim.keymap.set('n', '<C-u>', '<C-u>zz',
	{silent = false, desc = 'half-page up on the mid-page'})
vim.keymap.set('n', 'n', 'nzzzv',
	{silent = false, desc = 'keep search on the mid-page'})
vim.keymap.set('n', 'N', 'Nzzzv',
	{silent = false, desc = 'keep search on the mid-page'})
vim.keymap.set('n', 'Q', '<nop>',
	{silent = false, desc = 'no ex-mode'})

-- quickfix navs {{{
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz',
	{silent = true, desc = 'quickfix menu - next', noremap = true})
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz',
	{silent = true, desc = 'quickfix menu - previous', noremap = true})

vim.keymap.set('n', '<C-n>', '<cmd>lnext<CR>zz',
	{silent = true, desc = 'location list - next'})
vim.keymap.set('n', '<C-p>', '<cmd>lprev<CR>zz',
	{silent = true, desc = 'location list - previous', noremap = true})

vim.keymap.set('n', '<leader>oq', '<cmd>copen<CR>zz',
	{silent = true, desc = 'quickfix menu - open'})
vim.keymap.set('n', '<leader>ol', '<cmd>lopen<CR>zz',
	{silent = true, desc = 'location list - open'})
-- }}}


vim.keymap.set('n', '<leader>s/', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
	{silent = false, desc = 'replace current word'})
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>',
	{ silent = true, desc = 'chmod +x %' })

-- go to next/previous buffer/tab {{{
vim.keymap.set('n', '<leader>bn',  ':bnext<CR>',
		{ silent = true, noremap = true, desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp',  ':bprevious<CR>',
		{ silent = true, noremap = true, desc = "Previous buffer" })
vim.keymap.set('n', '<leader>bk',  ':bd<CR>',
		{ silent = true, noremap = true, desc = "Delete buffer" })
vim.keymap.set('n', '<leader>bl',  ':ls<CR>',
		{ silent = true, noremap = true, desc = "List buffers" })

-- vim.keymap.set('n', '<leader>tc',  ':tabnew<CR>',
-- 		{ silent = true, noremap = true, desc = "Create tab" })
-- vim.keymap.set('n', '<leader>td',  ':tabclose<CR>',
-- 		{ silent = true, noremap = true, desc = "Close tab" })
-- vim.keymap.set('n', '<leader>tn',  ':tabnext<CR>',
-- 		{ silent = true, noremap = true, desc = "Next tab" })
-- vim.keymap.set('n', '<leader>tp',  ':tabprevious<CR>',
-- 		{ silent = true, noremap = true, desc = "Previous tab" })
-- }}}

---- switch tabs {{{
--map('n', '_', ':tabnext<CR>',
--		{ silent = true, noremap = true, desc = "Next file in tab" })
---- }}}

---- comment lines via - and uncomment via + {{{
---- comment_localleader var definition {{{
--au( [[let b:comment_localleader = '//']],
--	{ 'c', 'cpp', 'java', 'scala', 'json', 'rust', 'go' })
--
--au( [[let b:comment_localleader = '#']],
--	{ 'sh', 'zsh', 'csh', 'ruby', 'python', 'conf', 'yaml', 'make', 'toml', 'rmd', 'sent' })
--
--au( [[let b:comment_localleader = '--']],
--	{ 'haskell', 'lua', })
--
--au( [[let b:comment_localleader = '"']],
--	{ 'vim', })
--
--au( [[let b:comment_localleader = '%']],
--	{ 'tex', 'plaintex', })
--
--au( [[let b:comment_localleader = '.\"']],
--	{ 'nroff', })
--
--au( [[let b:comment_localleader = ';']],
--	{ 'asm', 'lisp' })
---- }}}

--
---- noremap <silent> - :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_localleader,'\/')<CR>/<CR>:nohlsearch<CR>
---- noremap <silent> + :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_localleader,'\/')<CR>//e<CR>:nohlsearch<CR>
--
---- keybinding
--vim.keymap.set('', '-',
--	[[:<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_localleader,'\/')<CR>/<CR>:nohlsearch<CR>]],
--	{ silent = true, noremap = true, desc = "comment line at 0" })
--vim.keymap.set('', '+',
--	[[:<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_localleader,'\/')<CR>//e<CR>:nohlsearch<CR>]],
--	{ silent = true, noremap = true, desc = "uncomment line at 0" })
--
--vim.keymap.set('', '<leader>1',
--	[[:s=\v^(\s*)=\1<C-R>=escape(b:comment_localleader,'\ ')<CR><CR>:nohlsearch<CR>]],
--	{ silent = true, noremap = true, desc = "comment lines at ^" })
--vim.keymap.set('', '<leader>2',
--	[[:s=\v^(\s*)\<C-R>=escape(b:comment_localleader,'\= ')<CR>=\1=<CR>:nohlsearch<CR>]],
--	{ silent = true, noremap = true, desc = "uncomment lines at ^" })
--
--vim.keymap.set('n', '<localleader>A', [[]],
--	{ silent = true, noremap = true, desc = "Append comment" })
--
---- }}}

---- autofill {{{
--vim.keymap.set('n', '<localleader>aa', ':lua AutoFill()<CR>',
--		{ silent = true, noremap = true, desc = "Toggle autofill (all)" })
--vim.keymap.set('n', '<localleader>af', ':lua AutoFillToggle()<CR>',
--		{ silent = true, noremap = true, desc = "Toggle basic autofill" })
--vim.keymap.set('n', '<localleader>ad', ':lua AutoFillMarkdownToggle()<CR>',
--		{ silent = true, noremap = true, desc = "Toggle markdown autofill" })
--vim.keymap.set('n', '<localleader>as', ':lua AutoFillSentToggle()<CR>',
--		{ silent = true, noremap = true, desc = "Toggle sent autofill" })
---- }}}

-- lsp {{{
vim.keymap.set('n', '<localleader>lb', ':LspStart<CR>',
	{silent = true, desc = 'LSP Start'})
vim.keymap.set('n', '<localleader>lr', ':LspRestart<CR>',
	{silent = true, desc = 'LSP Restart'})
vim.keymap.set('n', '<localleader>ls', ':LspStop<CR>',
	{silent = true, desc = 'LSP Stop'})
vim.keymap.set('n', '<localleader>li', ':LspInfo<CR>',
	{silent = true, desc = 'LSP Info'})
vim.keymap.set('n', '<localleader>ll', ':LspLog<CR>',
	{silent = true, desc = 'LSP Logs'})
-- }}}

-- tmux sessionizer {{{
vim.keymap.set("n", "<C-f>", ":!tmux neww tmux-sessionizer<CR>",
	{ silent = true, desc = "tmux" })
-- }}}
