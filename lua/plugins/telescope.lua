return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

	config = function()

		require('telescope').setup({
			defaults = {
				border = true,
				borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
				winblend = 10,
			},
		})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find Files"})
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find Git Files"})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, {desc = "Grep string to quickfix list"})
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<C-s>', function()
            builtin.grep_string({ search = vim.fn.input("Grep: ") })
        end, {desc = "Search files that contains string"})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Serach help pages"})
        vim.keymap.set('n', '<C-o>', builtin.buffers, { desc = "List buffers"})

    end
}

