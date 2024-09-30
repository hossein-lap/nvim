local options = {
	belloff = "all",
	inccommand = "nosplit",
	grepprg = "rg",
	signcolumn = "yes",
	backup = false,
	swapfile = true,
	undofile = true,
	undodir = os.getenv("HOME")..'/.config/nvim/undodir',
	number = true,
	relativenumber = true,
	wrap = true,
	laststatus = 2,
	autochdir = false,
	linebreak = true,
	wildmenu = true,
	completeopt = {
		'menuone',
		'noselect'
	},
	showcmd = true,
	showmode = true,
	expandtab = true,
	tabstop = 4,
	shiftwidth = 4,
	autoindent = true,
	smartindent = true,
	incsearch = true,
	hlsearch = true,
	cursorline = true,
	scrolloff = 8,
	foldmethod = 'manual',
	foldenable = true,
	foldnestmax = 99,
	foldlevel = 0,
	splitbelow = true,
	splitright = true,
	spelllang = {
		'en_us',
		'de',
	},
	spellsuggest = 'best',
	-- hidden = true,
	-- list = true,
	-- listchars = {
	-- 	-- tab = '› ', -- <Tab> special character
	-- 	tab = '⎪ ', -- <Tab> special character
	-- 	-- trail = '⋅',
	-- 	-- lead = '-',
	-- 	-- eol = ' ', -- <End Of Line> special character
	-- 	-- nbsp = "␣",
	-- 	-- extends = "+",
	-- 	-- precedes = "·",
	-- 	-- multispace = "…", -- show chars if I have multiple spaces between text
	-- 	-- leadmultispace = "—", -- also show when they're at the start
	-- },
	termbidi = true,
	background = 'dark',
	colorcolumn= '79',
	guicursor = "",
	updatetime = 50,
	termguicolors = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

