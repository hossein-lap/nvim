vim.lsp.set_log_level("debug")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--cmp_nvim_lsp.default_capabilities

local lspconfig = require('lspconfig')

-- styles
local hl_name = 'Identifier'

-- border {{{
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
-- icons {{{
local icons = {
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
---- texts {{{
--local texts = {
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

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
--	'html', 'cssls', 'jsonls', 'eslint',
	'lua_ls', 'bashls', 'pyright',
	'clangd', 'gopls',
	'texlab',
	'vimls',
	'perlnavigator',
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
--		on_attach = my_custom_on_attach,
		capabilities = capabilities,
	}
end

-- luasnip setup
--vim.opt.completeopt = "menuone,noselect"

--local cmp_window = require "cmp.utils.window"
--cmp_window.info_ = cmp_window.info
--cmp_window.info = function(self)
--	local info = self:info_()
--	info.scrollable = true
--	return info
--end

-- nvim-cmp setup
--local cmp = require 'cmp'
local present, cmp = pcall(require, "cmp")

if not present then
	return
end

-- If you want insert `(` after select function or method item
-- **requires** `nvim-autopairs`
local ap_present, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if ap_present then
	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

--   פּ ﯟ   some other good icons
-- all options as a table {{{
local options = {
	-- window {{{
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
	-- }}}
	-- snippet {{{
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	-- }}}
	-- formatting {{{
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
	}, -- }}}
	-- mappings {{{
	mapping = {

		-- ['<Up>'] = cmp.mapping.abort(),
		-- ['<Down>'] = cmp.mapping.abort(),
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
	-- sources {{{
	sources = {
		{name = 'path', keyword_length = 1},
		{name = 'nvim_lsp', keyword_length = 1},
		{name = 'nvim_lua', keyword_length = 1},
		{name = 'buffer', keyword_length = 1},
		{name = 'luasnip', keyword_length = 1},

--		{ name = "path", priority = 3 },
--		{ name = "nvim_lsp", keyword_lenth = 5, priority = 5 },
--		{ name = "nvim_lua", keyword_lenth = 5, priority = 4 },
--		{ name = "buffer", priority = 3 },
--		{ name = "luasnip", priority = 1 },

--		{ name = 'dictionary', keyword_lenth = 3, priority = 2 },
	},
	-- }}}
--	-- sorting {{{
--	sorting = {
--		priority_weight = 1.0,
--		comparators = {
----			compare.score_offset, -- not good at all
--			compare.locality,
--			compare.recently_used,
--			-- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
--			compare.score,
--			compare.offset,
--			compare.order,
----			compare.scopes, -- what?
----			compare.sort_text,
----			compare.exact,
----			compare.kind,
----			compare.length, -- useless 
--		},
--	},
--	-- }}}
}
-- }}}

cmp.setup(options)

--require('plugin/cmp/bashls') -- bash lsp
--require('plugin/cmp/clangd') -- C/C++ lsp
--require('plugin/cmp/gopls') -- golang lsp
--require('plugin/cmp/html-css') -- html lsp
--require('plugin/cmp/lua_ls') -- Lua lsp
--require('plugin/cmp/pyright') -- python lsp
--require('plugin/cmp/texlab') -- LaTeX lsp

--function LspToggle()
--	local clients = vim.lsp.get_active_clients()
--	if next(clients) == nil then
--		vim.notify("LSP is not active", 2, {title ='LspToggle()'})
--	else
--		vim.notify("LSP is active", 2, {title ='LspToggle()'})
--	end
--end
--
--vim.keymap.set('n', '<localleader>ls', ':lua LspToggle()<CR>', {silent = true})
