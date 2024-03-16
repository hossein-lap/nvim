local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- picker function
local function SelectList(input_data)
	local opts = require("telescope.themes").get_dropdown({test = true})

	local data = input_data or {}
	local title = data.title or "Default Title"
	local dir_path = data.dir or ""
	vim.notify(dir_path, 4)
	local custom_item = data.items or {}

	local tmp_table = data or {}

	-- if dir_path ~= "" or dir_path ~= nil then
	-- 	for _, value in pairs(vim.fn.readdir(dir_path)) do
	-- 		if not value:match('%.tar.') and not value:match('^%.') and not value:match('~$') then
	-- 			table.insert(tmp_table, value)
	-- 		end
	-- 	end
	-- else
	-- 	for _, value in pairs(custom_item) do
	-- 		table.insert(tmp_table, value)
	-- 	end
	-- end

	pickers.new(opts, {
		prompt_title = title,
		finder = finders.new_table {
			results = tmp_table
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				local selected = selection[1]

				-- do the thing with it
				vim.notify(selected, 4)
			end)
			return true
		end,
	}):find()
end

vim.keymap.set("n", "<leader>tt", function()
	SelectList({ title = 'test', items = {1, 2, 3, 4, 5} })
end, {})
