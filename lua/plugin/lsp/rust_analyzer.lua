local on_attach = function(client)
    require'completion'.on_attach(client)
end

require'lspconfig'.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- require('rust-tools').setup({
--     -- All configs below you can found at:
--     -- https://github.com/simrat39/rust-tools.nvim
--
--     -- rust-tools options
--     tools = {
--         -- Automatically set inlay hints (type hints)
--         autoSetHints = true,
--
--         -- Whether to show hover actions inside the hover window
--         -- This overrides the default hover handler
--         hover_with_actions = false,
--
--         -- These apply to the default RustSetInlayHints command
--         inlay_hints = {
--
--             -- wheter to show parameter hints with the inlay hints or not
--             show_parameter_hints = false,
--
--             -- prefix for parameter hints
--             parameter_hints_prefix = "<- ",
--
--             -- prefix for all the other hints (type, chaining)
--             -- other_hints_prefix = "=> ",
--             other_hints_prefix = ">>> ",
--         },
--     },
--     --
--     -- rust-analyer options
--     -- all the opts to send to nvim-lspconfig
--     -- these override the defaults set by rust-tools.nvim
--     -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
--     server = {
--         on_attach = custom_lsp_attach,
--         capabilities = capabilities,
--         settings = {
--             ["rust-analyzer"] = {
--                 checkOnSave = {
--                     enable = true,
--                     command = "check",
--                     extraArgs = {
--                         { "--target-dir", "/tmp/rust-analyzer-check" },
--                     },
--                 },
--             },
--         },
--     }
-- })
