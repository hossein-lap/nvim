local lsp = require('lsp-zero').preset({})
local hl_name = 'Normal'
-- local hl_name = 'Pmenu'
-- local hl_name = 'Visual'

local borders = { -- {{{
	ascii = {
		{ "/", hl_name },
		{ "-", hl_name },
		{ "\\", hl_name },
		{ "|", hl_name },
	},
	single = {
		{ "┌", hl_name },
		{ "─", hl_name },
		{ "┐", hl_name },
		{ "│", hl_name },
		{ "┘", hl_name },
		{ "─", hl_name },
		{ "└", hl_name },
		{ "│", hl_name },
	},
	double = {
		{ "╔", hl_name },
		{ "═", hl_name },
		{ "╗", hl_name },
		{ "║", hl_name },
		{ "╝", hl_name },
		{ "═", hl_name },
		{ "╚", hl_name },
		{ "║", hl_name },
	},
	rounded = {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	},
}
-- }}}
local icons = { -- {{{
	Class = "",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "",
	Operator = "",
	Property = "",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "",
	TypeParameter = "",
	Unit = "",
	Value = "",
	Variable = "v",
} -- }}}
--local texts = { -- {{{
--	Class = "cls",
--	Color = "clr",
--	Constant = "cnt",
--	Constructor = "ctr",
--	Enum = "enm",
--	EnumMember = "emm",
--	Event = "evt",
--	Field = "fld",
--	File = "fil",
--	Folder = "fld",
--	Function = "fn",
--	Interface = "itf",
--	Keyword = "kyw",
--	Method = "mtd",
--	Module = "mdl",
--	Operator = "opr",
--	Property = "prt",
--	Reference = "ref",
--	Snippet = "snp",
--	Struct = "str",
--	Text = "txt",
--	TypeParameter = "tpr",
--	Unit = "unt",
--	Value = "vlu",
--	Variable = "var",
--} -- }}}

--lsp.default_keymaps({
--	bufer = bufnr,
--	omit = {'<Up>', '<Down>'},
--})

-- lsp servers
lsp.setup_servers({
	'html', 'cssls', 'jsonls', 'tsserver',
	'clangd', 'gopls',
	'lua_ls', 'bashls', 'pyright',
	'texlab',
})

lsp.ensure_installed({
	'clangd', 'gopls',
	'lua_ls', 'bashls', 'pyright',
	'texlab', 'perlnavigator'
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	sources = {
		{name = 'path', keyword_length = 1},
		{name = 'nvim_lsp', keyword_length = 1},
		{name = 'nvim_lua', keyword_length = 1},
		{name = 'buffer', keyword_length = 1},
		{name = 'luasnip', keyword_length = 1},
	},
	mapping = {
		['<Up>'] = cmp.mapping.abort(),
		['<Down>'] = cmp.mapping.abort(),
		-- ["<Up>"] = nil,
		['<C-y>'] = cmp.mapping.confirm({select = true}),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		--		['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
		--		['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
		["<C-s>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(
				vim.api.nvim_replace_termcodes(
				"<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, { "i", "s", }),
		["<C-a>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(
				vim.api.nvim_replace_termcodes(
				"<Plug>luasnip-jump-prev", true, true, true) , "")
			else
				fallback()
			end
		end, { "i", "s", }),
		['<C-p>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item(cmp_select_opts)
			else
				cmp.complete()
			end
		end),
		['<C-n>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item(cmp_select_opts)
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
		completion = {
			winhighlight =  "Normal:CmpPmenu,CursorLine:Visual,Search:None",
			border = borders["single"]
		},
		documentation = {
			border = borders["single"]
		}
	},
	formatting = {
		fields = {'abbr', 'menu', 'kind'},
		format = function(entry, item)
			item.kind = string.format("[%s]", icons[item.kind])
			-- item.kind = string.format("%s", texts[item.kind])

				local short_name = {
					nvim_lsp = 'l',
					path = 'p',
					buffer = 'b',
					nvim_lua = 'n',
					luasnip = 'l'
				}

				local menu_name = short_name[entry.source.name] or entry.source.name
				item.menu = string.format('[%s]', menu_name)
				return item
			end,
	},
	-- mapping = {
	-- 	['<C-f>'] = cmp_action.luasnip_jump_forward(),
	-- 	['<C-b>'] = cmp_action.luasnip_jump_backward(),
	-- }
})


lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({
		bufer = bufnr,
		omit = {'<Up>', '<Down>'},
	})
end)
