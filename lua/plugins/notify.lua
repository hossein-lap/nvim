return {
    'rcarriga/nvim-notify',

    config = function()
        require("notify").setup({
            background_colour = "NotifyBackground",
            fps = 30,
            icons = {
                -- DEBUG = "DDD",
                -- ERROR = "XXX",
                -- INFO  = "III",
                -- TRACE = "TTT",
                -- WARN  = "WWW",
                DEBUG = "",
                ERROR = "",
                INFO  = "",
                TRACE = "✎",
                WARN  = ""
            },
            level = 2,
            minimum_width = 100,
            -- render = "wrapped-compact",
            render = "compact",
            stages = "static",
            time_formats = {
                notification = "%T",
                notification_history = "%FT%T"
            },
            timeout = 10000,
            top_down = true
        })
    end
}
