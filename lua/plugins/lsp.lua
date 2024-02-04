local function map(mode, bind, command, extra)
	
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
		-- "windwp/nvim-autopairs",
    },

	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		-- local autopari_options = {
		-- 	disable_filetype = { "TelescopePrompt", "spectre_panel" },
		-- 	disable_in_macro = false,
		-- 	disable_in_visualblock = false,
		-- 	disable_in_replace_mode = true,
		-- 	ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
		-- 	enable_moveright = true,
		-- 	enable_afterquote = true,
		-- 	enable_check_bracket_line = true,
		-- 	enable_bracket_in_quote = true,
		-- 	enable_abbr = false,
		-- 	break_undo = true,
		-- 	check_ts = false,
		-- 	map_cr = true,
		-- 	map_bs = true,
		-- 	map_c_h = false,
		-- 	map_c_w = false,
		-- }
		-- require('nvim-autopairs').setup(autopari_options)

		require("fidget").setup({
			display = {
				done_icon = "✓",
			}
		})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"pylsp",
				"clangd",
				"texlab",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								}
							}
						}
					}
				end,
			}
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				-- ["<C-s>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_next_item()
				-- 	elseif require("luasnip").expand_or_jumpable() then
				-- 		vim.fn.feedkeys(
				-- 			vim.api.nvim_replace_termcodes(
				-- 				"<Plug>luasnip-expand-or-jump", true, true, true), ""
				-- 		)
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s", }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
				}, {
					{ name = 'buffer' },
					{ name = 'path' },
			}),
			window = {
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
				},
			},

			formatting = {
				fields = {'abbr', 'menu', 'kind'},
				format = function(entry, item)
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

		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

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

	end
}
