local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local skels = os.getenv("HOME")..'/.config/nvim/skels/'

-- picker function
local function Skeleton()
	local opts = require("telescope.themes").get_dropdown({test = true})
	local tmp_table = {}
	for _, value in pairs(vim.fn.readdir(skels)) do
		if not value:match('%.tar.xz$') and not value:match('^%.') and not value:match('~$') then
			table.insert(tmp_table, value)
		end
	end

	pickers.new(opts, {
		prompt_title = "Skeleton Files",
		finder = finders.new_table {
			results = tmp_table
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				local selected = skels..selection[1]

				vim.cmd(':-1r '..selected)
			end)
			return true
		end,
	}):find()
end

vim.keymap.set("n", "<leader>tm", function()
	Skeleton()
end, {})
