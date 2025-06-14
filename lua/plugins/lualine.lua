return {
    "nvim-lualine/lualine.nvim",
    config = function()

        -- separators
        local separators = {
            none        = { left = '',   right = '' },
            blank       = {
                left = string.rep("-", 3),
                right = string.rep("-", 3)
            },
            pipe        = { left = '|',  right = '|' },
            single      = { left = '›',  right = '‹'  },
            double      = { left = '»',  right = '«'  },
            long        = { left = '⟩',  right = '⟨'  },
            ascii       = { left = '>',  right = '<'  },
        }

        -- config
        local config = {
            options = {
                always_divide_middle = true,
                globalstatus = false,
                tabline = true,
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_c = {"%.80F"},
                lualine_x = {"%y"},
                lualine_y = {},
                lualine_z = {},
            },

            -- tabline = {
            --     -- these are to remove the defaults
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = {},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {},
            --     -- These will be filled later
            -- },

        }

        -- color
        local color = {
            white    = "#ffffff",
            black    = "#232323",
            bg       = "#181818",
            fg       = "#cccccc",
            cb       = os.getenv("color4") or "#005577",
            cf       = os.getenv("color5") or "#557700",
            -- cb       = "#005577",
            -- cf       = "#557700",
        }

        config.options.theme = {
            normal = {
                b = { fg = color.fg, bg = color.cb, gui = "none" },
                c = { fg = color.fg, bg = color.bg, gui = "none" },
                x = { fg = color.fg, bg = color.bg, gui = "none" },
                y = { fg = color.fg, bg = color.cb, gui = "none" },
            },
            insert = {
                b = { fg = color.fg, bg = color.cb, gui = "none" },
                c = { fg = color.fg, bg = color.bg, gui = "none" },
                x = { fg = color.fg, bg = color.bg, gui = "none" },
                y = { fg = color.fg, bg = color.cb, gui = "none" },
            },
            visual = {
                b = { fg = color.fg, bg = color.cb, gui = "none" },
                c = { fg = color.fg, bg = color.bg, gui = "none" },
                x = { fg = color.fg, bg = color.bg, gui = "none" },
                y = { fg = color.fg, bg = color.cb, gui = "none" },
            },
            replace = {
                b = { fg = color.fg, bg = color.cb, gui = "none" },
                c = { fg = color.fg, bg = color.bg, gui = "none" },
                x = { fg = color.fg, bg = color.bg, gui = "none" },
                y = { fg = color.fg, bg = color.cb, gui = "none" },
            },
            command = {
                b = { fg = color.fg, bg = color.cb, gui = "none" },
                c = { fg = color.fg, bg = color.bg, gui = "none" },
                x = { fg = color.fg, bg = color.bg, gui = "none" },
                y = { fg = color.fg, bg = color.cb, gui = "none" },
            },
        }

        -- left
        local function leftline(component)
            table.insert(config.sections.lualine_c, component)
        end

        table.insert(config.sections.lualine_b, {
            function()
                local mode = string.upper(vim.api.nvim_get_mode()["mode"])
                return mode
            end
        })

        leftline("%.50F%m %r%h%w")
        leftline({
            "branch",
            icon = '',
        })
        leftline({
            "diff",
            diff_color = {
                removed  = { fg = color.fg },
                modified = { fg = color.fg },
                added    = { fg = color.fg },
            },
            symbols = {
                added = '+',
                modified = '~',
                removed = '-'
            },
        })

        -- right
        local function rightline(component)
            table.insert(config.sections.lualine_x, component)
        end

        rightline({
            function()
                local diag = {
                    hint = #vim.diagnostic.get(0, {severity=vim.diagnostic.severity.HINT}),
                    info = #vim.diagnostic.get(0, {severity=vim.diagnostic.severity.INFO}),
                    warning = #vim.diagnostic.get(0, {severity=vim.diagnostic.severity.WARNING}),
                    error   = #vim.diagnostic.get(0, {severity=vim.diagnostic.severity.ERROR}),
                }
                local diagnostics = string.format('%s %s %s %s',
                    'E:'..diag["error"],
                    'W:'..diag["warning"],
                    'H:'..diag["hint"],
                    'I:'..diag["info"]
                )
                return diagnostics
            end
        })

        rightline({
            function()
                local ft = vim.bo.filetype
                if ft ~= "" then
                    return string.format("%s", ft)
                else
                    return ft
                end
            end
        })

        table.insert(config.sections.lualine_y, {
            function()
                return "%c:%l/%L"
            end
        })

        config.options.section_separators = separators.none
        config.options.component_separators = separators.blank
        require('lualine').setup(config)

    end
}
