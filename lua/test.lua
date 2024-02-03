-- local pickers = require "telescope.pickers"
-- local finders = require "telescope.finders"
-- local conf = require("telescope.config").values
-- local actions = require "telescope.actions"
-- local action_state = require "telescope.actions.state"
--
-- local runner = function(opts)
-- 	opts = opts or {}
--
-- 	pickers.new(opts, {
-- 		finder = finders.new_table {
-- 			results = { "Build", "Debug", "Run", "BuildRun" }
--
-- 		},
-- 		sorter = conf.generic_sorter(opts),
-- 		attach_mappings = function(bufnr, map)
-- 			actions.select_default:replace(function()
-- 				actions.close(bufnr)
-- 				local selection = action_state.get_selected_entry()
-- 				vim.cmd(selection[1])
-- 			end)
-- 			return true
-- 		end,
-- 	}):find()
-- end
--
-- return runner(require("telescope.themes").get_dropdown {})

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- our picker function: colors
local function colors(opts)
	opts = opts or {}
	-- if opts.test then
	-- 	vim.notify("This is a FUCKING test!", 3)
	-- 	return 0
	-- end
	pickers.new(opts, {
		prompt_title = "Skeleton Files",
		finder = finders.new_table {
			results = { "red", "green", "blue" }
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				-- vim.notify(vim.inspect(selection[1]), 4)
				-- return 0

				-- vim.api.nvim_put({ selection[1] }, "", false, true)
			end)
			return true
		end,
	}):find()
end

-- to execute the function
colors(require("telescope.themes").get_dropdown {test = true})
