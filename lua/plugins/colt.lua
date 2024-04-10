return {
	{

		"hossein-lap/colt",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},

		config = function()
			local colt = require("colt")

			-- Compile/Run/Debug
			vim.keymap.set('n', '<localleader>fq', function()
				colt.trigger({
					filetype = vim.bo.filetype,
					work = "run",
					window = "t"
				}) end, {
					silent = true,
					desc = 'Run current file - new buffer',
				}
			)

			vim.keymap.set('n', '<localleader>fQ', function()
				colt.trigger({
					filetype = vim.bo.filetype,
					work = "run",
					window = "f"
				}) end, {
					silent = true,
					desc = 'Run current file - new buffer',
				}
			)

			vim.keymap.set('n', '<localleader>fe', function()
				colt.trigger({
					filetype = vim.bo.filetype,
					work = "compile",
					silent = true
				}) end, {
					silent = true,
					desc = 'quickfix › Compile current file'
				}
			)

			vim.keymap.set('n', '<localleader>fw', function()
				colt.trigger({
					filetype = vim.bo.filetype,
					work = "debug",
					silent = true
				}) end, {
					silent = true,
					desc = 'quickfix › Debug current file'
				}
			)

			---- makefile
			vim.keymap.set('n', '<localleader>cc', function()
					colt.run("make", {})
			end, { silent = true, desc = 'make › all' })

			vim.keymap.set('n', '<localleader>ca', function()
					colt.quickfix("make", {silent = false})
			end, { silent = true, desc = 'quickfix › make' })
			vim.keymap.set('n', '<localleader>cd', function()
					colt.quickfix("make clean", {silent = true})
			end, { silent = true, desc = 'quickfix › make clean' })
			vim.keymap.set('n', '<localleader>cf', function()
					colt.quickfix("make force", {silent = true})
			end, { silent = true, desc = 'quickfix › make force' })
			vim.keymap.set('n', '<localleader>cb', function()
					colt.quickfix("make build", {silent = true})
			end, { silent = true, desc = 'quickfix › make build' })
			vim.keymap.set('n', '<localleader>cF', function()
					colt.quickfix("make full", {silent = true})
			end, { silent = true, desc = 'quickfix › make full' })

		end
	}
}
