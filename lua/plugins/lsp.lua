local function map(mode, bind, command, extra)
    vim.keymap.set(mode, bind, command, extra)
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
    },

    -- config section
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- lsp log
        require("fidget").setup({
            progress = {
                display = {
                    done_icon = "✓",
                }
            }
        })

        -- lsp manager
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "→",
                    package_uninstalled = "×"
                }
            }
        })

        local lspconfig = require('lspconfig')
        local servers = {
            -- 'html', 'cssls', 'jsonls', 'eslint',
            'lua_ls',
            'bashls',
            "pylyzer",
            -- 'pyright',
            -- 'clangd',
            'gopls',
            'texlab',
            'vimls',
            -- "ruby-lsp",
            "yamlls",
            -- "ansible-language-server",
            -- "helm-ls",
            -- "terraform-ls",
            -- "elixir-ls",
            -- "nginx-language-server",
            -- "docker-langserver",
            -- "docker-compose-langserver",
            -- 'perlnavigator',
            -- 'rust_analyzer',
        }
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
                -- on_attach = my_custom_on_attach,
                capabilities = capabilities,
            }
        end

        require("mason-lspconfig").setup({
            ensure_installed = {
                -- -- programming
                "gopls", "lua_ls",
                -- "clangd",
                -- "ruby_lsp",
                "pylyzer",
                -- "rust_analyzer",
                -- "perlnavigator",
                "bashls",
                -- "elixirls", "elmls",
                -- -- extra
                "texlab", "vimls",
                -- devops
                "yamlls", "ansiblels", "dockerls",
                "docker_compose_language_service",
            },

            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    -- local lspconfig = require("lspconfig")
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

        -- auto completion
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
                --     if cmp.visible() then
                --         cmp.select_next_item()
                --     elseif require("luasnip").expand_or_jumpable() then
                --         vim.fn.feedkeys(
                --             vim.api.nvim_replace_termcodes(
                --                 "<Plug>luasnip-expand-or-jump", true, true, true), ""
                --         )
                --     else
                --         fallback()
                --     end
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
                        path = 'path',
                        luasnip = 'cmp',
                        nvim_lsp = 'lsp',
                        buffer = 'buf',
                        nvim_lua = 'nsp',
                    }
                    local menu_name = short_name[entry.source.name] or entry.source.name
                    item.menu = string.format('[%s]', menu_name)
                    return item
                end,
            },
        })

        -- diagnostic config
        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "single",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        -- keybindings
        map("n", "<leader>D", vim.lsp.buf.type_definition, {desc = "Type definition (?!)"})
        map("n", "gD", function() vim.lsp.buf.declaration() end, {desc = "Jump to declaration"})
        map("n", "gi", function() vim.lsp.buf.implementation() end, {desc = "Jump to implementation"})
        map("n", "<C-h>", function() vim.lsp.buf.signature_help() end, {desc = "Signature help (?!)"})
        map("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, {desc = "Add a folder to current workspace"})
        map("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, {desc = "Remove a folder from current workspace"})
        map("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, {desc = "Print list of folders inside current workspace"})
        map("n", "gd", function() vim.lsp.buf.definition() end, {desc = "Jump to definition"})
        map("n", "K", function() vim.lsp.buf.hover() end, {desc = "Show details of currect object/var/etc..."})
        map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {desc = "Show programming symbols of current workspace"})
        map("n", "<leader>vd", function() vim.diagnostic.open_float() end, {desc = "Open diagnostics flating menu"})
        map("n", "[d", function() vim.diagnostic.goto_prev() end, {desc = "diagnostic next"})
        map("n", "]d", function() vim.diagnostic.goto_next() end, {desc = "diagnostic prev"})
        map("n", "<leader>vca", function() vim.lsp.buf.code_action() end , {desc = "Apply the code action"})
        map("n", "<leader>vrr", function() vim.lsp.buf.references() end , {desc = "Show the refs"})
        map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {desc = "Rename current name on all of the code base / buffer"})
        map("n", "<leader>ll", function()
            vim.diagnostic.setloclist({open = false})
        end, {desc = "Create location list from diagnostics but don't open it"})
        map("n", "<leader>lo", function()
            vim.diagnostic.setloclist()
        end, {desc = "Create location list from diagnostics and open it"})
        map("n", "<leader>lh", function() vim.diagnostic.hide() end, {desc = "Show diagnostics"})
        map("n", "<leader>ls", function() vim.diagnostic.show() end, {desc = "Hide diagnostics"})

    end
}
