-- helper {{{

-- key mapping {{{
function map(mode, key, command, opts)
	local options = { buffer = bufnr, noremap = true, silent = true, remap = false }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, command, options)
end
-- }}}

-- }}}

local lsp = require('lsp-zero').preset({})
local hl_name = 'Normal'
-- local hl_name = 'Identifier'
-- local hl_name = 'Visual'
-- local hl_name = 'Pmenu'

-- borders {{{
local borders = {
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

-- -- labels {{{
-- local lsp_label = {
-- 	Class = {
-- 		text = "cls",
-- 		icon = "",
-- 	},
-- 	Color = {
-- 		text = "clr",
-- 		icon = "",
-- 	},
-- 	Constant = {
-- 		text = "cnt",
-- 		icon = "",
-- 	},
-- 	Constructor = {
-- 		text = "ctr",
-- 		icon = "",
-- 	},
-- 	Enum = {
-- 		text = "enm",
-- 		icon = "",
-- 	},
-- 	EnumMember = {
-- 		text = "emm",
-- 		icon = "",
-- 	},
-- 	Event = {
-- 		text = "evt",
-- 		icon = "",
-- 	},
-- 	Field = {
-- 		text = "fld",
-- 		icon = "",
-- 	},
-- 	File = {
-- 		text = "fil",
-- 		icon = "",
-- 	},
-- 	Folder = {
-- 		text = "fld",
-- 		icon = "",
-- 	},
-- 	Function = {
-- 		text = "fn",
-- 		icon = "",
-- 	},
-- 	Interface = {
-- 		text = "itf",
-- 		icon = "",
-- 	},
-- 	Keyword = {
-- 		text = "kyw",
-- 		icon = "",
-- 	},
-- 	Method = {
-- 		text = "mtd",
-- 		icon = "",
-- 	},
-- 	Module = {
-- 		text = "mdl",
-- 		icon = "",
-- 	},
-- 	Operator = {
-- 		text = "opr",
-- 		icon = "",
-- 	},
-- 	Property = {
-- 		text = "prt",
-- 		icon = "",
-- 	},
-- 	Reference = {
-- 		text = "ref",
-- 		icon = "",
-- 	},
-- 	Snippet = {
-- 		text = "snp",
-- 		icon = "",
-- 	},
-- 	Struct = {
-- 		text = "str",
-- 		icon = "",
-- 	},
-- 	Text = {
-- 		text = "txt",
-- 		icon = "",
-- 	},
-- 	TypeParameter = {
-- 		text = "tpr",
-- 		icon = "",
-- 	},
-- 	Unit = {
-- 		text = "unt",
-- 		icon = "",
-- 	},
-- 	Value = {
-- 		text = "vlu",
-- 		icon = "",
-- 	},
-- 	Variable = {
-- 		text = "var",
-- 		icon = "var",
-- 	},
-- }
-- -- }}}

-- lsp servers {{{
lsp.setup_servers({
	'clangd',
	'rust_analyzer',

	'gopls',
	'lua_ls',
	'texlab',

	-- 'qmllint',
	-- 'html',
	-- 'cssls',
	-- 'jsonls',
	-- 'tsserver',

	'pylsp',
	-- 'bashls',
	-- 'perlnavigator',
	-- 'ansiblels',
	-- 'dockerls',
	-- 'vale_ls',
	-- -- 'grammarly',
})

-- lsp.ensure_installed({
-- 	'tsserver',
-- 	'html',
--	'cssls',
--	'jsonls',
-- 	-- 'clangd',
-- 	'rust_analyzer',
--
-- 	'gopls',
--	'lua_ls',
--	'pyright',
-- 	'texlab',
--
-- 	'bashls',
-- 	-- 'perlnavigator'
-- })
-- }}}

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- If you want insert `(` after select function or method item
-- **requires** `nvim-autopairs`
local ap_present, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if ap_present then
	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
else
	vim.notify(cmp_autopairs, 4, {title = 'cmp autopairs'})
end

-- setup {{{
cmp.setup({

	-- sources {{{
	sources = {
		{name = 'nvim_lsp', keyword_length = 1},
		{name = 'nvim_lua', keyword_length = 1},
		{name = 'path', keyword_length = 2},
		{name = 'buffer', keyword_length = 2},
		{name = 'luasnip', keyword_length = 3},
	},
	-- }}}

	-- mappings {{{
	mapping = {

		-- ['<Up>'] = cmp.mapping.abort(),
		-- ['<Down>'] = cmp.mapping.abort(),
		["<Up>"] = cmp.mapping(function()
			cmp.mapping.abort()
			vim.cmd("norm kli")
		end),
		["<Down>"] = cmp.mapping(function()
			cmp.mapping.abort()
			vim.cmd("norm jli")
		end),
		['<C-y>'] = cmp.mapping.confirm({select = true}),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-k>'] = cmp.mapping.scroll_docs(-4),
		['<C-j>'] = cmp.mapping.scroll_docs(4),
		--		['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
		--		['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
		["<C-s>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(
					vim.api.nvim_replace_termcodes(
						"<Plug>luasnip-expand-or-jump", true, true, true), ""
				)
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

	-- 	["<C-p>"] = cmp.mapping.select_prev_item(),
	-- 	["<C-n>"] = cmp.mapping.select_next_item(),
	-- 	["<C-u>"] = cmp.mapping.scroll_docs(-4),
	-- 	["<C-d>"] = cmp.mapping.scroll_docs(4),
	-- 	["<C-Space>"] = cmp.mapping.complete(),
	-- 	["<C-e>"] = cmp.mapping.close(),
	-- 	['<C-y>'] = cmp.mapping.confirm({select = true}),
	-- 	["<CR>"] = cmp.mapping.confirm {
	-- 		behavior = cmp.ConfirmBehavior.Replace,
	-- 		select = false,
	-- 	},
	-- 	["<C-s>"] = cmp.mapping(function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.select_next_item()
	-- 		elseif require("luasnip").expand_or_jumpable() then
	-- 			vim.fn.feedkeys(
	-- 				vim.api.nvim_replace_termcodes(
	-- 					"<Plug>luasnip-expand-or-jump", true, true, true), "")
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end, { "i", "s", }),
	-- 	["<C-a>"] = cmp.mapping(function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.select_prev_item()
	-- 		elseif require("luasnip").jumpable(-1) then
	-- 			vim.fn.feedkeys(
	-- 				vim.api.nvim_replace_termcodes(
	-- 					"<Plug>luasnip-jump-prev", true, true, true) , "")
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end, { "i", "s", }),
	},
	-- }}}

	-- snippet {{{
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	-- }}}

	-- window {{{
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),

		completion = {
			winhighlight =  "Normal:CmpPmenu,CursorLine:Visual,Search:None",
			border = "single",
		},
		documentation = {
			winhighlight =  "Normal:CmpPmenu,CursorLine:Visual,Search:None",
			border = "single",
		},
		diagnostic = {
			border = "single",
		}
	},
	-- }}}

	-- formatting {{{
	formatting = {
		fields = {'abbr', 'menu', 'kind'},
		format = function(entry, item)
		-- 	-- item.kind = string.format("[%s]", icons[item.kind])
		-- 	item.kind = string.format("%s", lsp_label[item.kind].text)

			local short_name = {
				nvim_lsp = 'lsp',
				path = 'path',
				buffer = 'buf',
				nvim_lua = 'nsp',
				luasnip = 'cmp'
			}
			local menu_name = short_name[entry.source.name] or entry.source.name
			item.menu = string.format('[%s]', menu_name)
			return item
		end,
	},
	-- }}}

})
-- }}}

-- keybinds {{{
-- local opts = { buffer = bufnr, noremap = true, silent = true, remap = false }
map("n", "<leader>D", vim.lsp.buf.type_definition)
map("n", "gD", function() vim.lsp.buf.declaration() end)
map("n", "gi", function() vim.lsp.buf.implementation() end)
map("n", "<C-h>", function() vim.lsp.buf.signature_help() end)
map("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end)
map("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end)
map("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
map("n", "gd", function() vim.lsp.buf.definition() end)
map("n", "K", function() vim.lsp.buf.hover() end)
map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
map("n", "<leader>vd", function() vim.diagnostic.open_float() end)
map("n", "[d", function() vim.diagnostic.goto_prev() end, {desc = "diagnostic next"})
map("n", "]d", function() vim.diagnostic.goto_next() end, {desc = "diagnostic prev"})
map("n", "<leader>vca", function() vim.lsp.buf.code_action() end )
map("n", "<leader>vrr", function() vim.lsp.buf.references() end )
map("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
map("n", "<leader>ll", function()
	vim.diagnostic.setloclist({open = false})
end)
map("n", "<leader>lo", function()
	vim.diagnostic.setloclist()
end)
map("n", "<leader>lh", function() vim.diagnostic.hide() end)
map("n", "<leader>ls", function() vim.diagnostic.show() end)
-- }}}
