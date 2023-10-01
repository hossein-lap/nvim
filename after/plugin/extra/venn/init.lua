-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
	local venn_enabled = vim.inspect(vim.b.venn_enabled)
	if venn_enabled == "nil" then
		vim.b.venn_enabled = true
		vim.cmd[[setlocal ve=all]]
		-- draw a line on HJKL keystokes
		vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
		vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
		vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
		vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
		-- draw a box by pressing "f" with visual selection
		vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
	else
		vim.cmd[[setlocal ve=]]
		vim.cmd[[mapclear <buffer>]]
		vim.b.venn_enabled = nil
	end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>vd', ":lua Toggle_venn()<CR>", { noremap = true})

------
------
------
------
------function VisualBlockBox()
------    -- Get the start and end positions of the visual-block selection
------    local start_row, start_col = unpack(vim.fn.getpos("'<")[2])
------    local end_row, end_col = unpack(vim.fn.getpos("'>")[2])
------
------    -- Calculate the length and height of the selected area
------    local width = end_col - start_col + 1
------    local height = end_row - start_row + 1
------
------    -- Create the top and bottom border strings using the calculated length
------    local border = "+" .. string.rep("-", width) .. "+"
------
------    -- Construct the padding by iterating through each line in the selection
------    local padding = {}
------    for i = start_row, end_row do
------        local line = vim.fn.getline(i)
------        local pad_line = "|" .. line:sub(start_col, end_col) .. "|"
------        table.insert(padding, pad_line)
------    end
------
------    -- Combine the border and padding strings to create the final box representation
------    local box_text = {border}
------    for _, line in ipairs(padding) do
------        table.insert(box_text, line)
------    end
------    table.insert(box_text, border)
------
------    -- Replace the selected text with the box representation
------    vim.fn.setreg(vim.v.register, table.concat(box_text, "\n"))
------end
----
----
----function VisualBlockBox()
----    -- Get the start and end positions of the visual-block selection
----    local start_row = vim.fn.line("'<")
----    local end_row = vim.fn.line("'>")
----    local start_col = vim.fn.col("'<")
----    local end_col = vim.fn.col("'>")
----
----    -- Calculate the length and height of the selected area
----    local width = end_col - start_col + 1
----    local height = end_row - start_row + 1
----
----    -- Create the top and bottom border strings using the calculated length
----    local border = "+" .. string.rep("-", width) .. "+"
----
----    -- Construct the padding by iterating through each line in the selection
----    local padding = {}
----    for i = start_row, end_row do
----        local line = vim.fn.getline(i)
----        local pad_line = "|" .. line:sub(start_col, end_col) .. "|"
----        table.insert(padding, pad_line)
----    end
----
----    -- Combine the border and padding strings to create the final box representation
----    local box_text = {border}
----    for _, line in ipairs(padding) do
----        table.insert(box_text, line)
----    end
----    table.insert(box_text, border)
----
----    -- Replace the selected text with the box representation
----    vim.fn.setreg(vim.v.register, table.concat(box_text, "\n"))
----end
--
--
--function VisualBlockBox()
--    -- Get the start and end positions of the visual-block selection
--    local start_row = vim.fn.line("'<")
--    local end_row = vim.fn.line("'>")
--    local start_col = vim.fn.col("'<")
--    local end_col = vim.fn.col("'>")
--
--    print('start_row', start_row)
--    print('end_row', end_row)
--    print('start_col', start_col)
--    print('end_col', end_col)
--
--    -- Calculate the length and height of the selected area
--    local width = end_col - start_col + 1
--    local height = end_row - start_row + 1
--
--    -- Create the top and bottom border strings using the calculated length
--    local border = "+" .. string.rep("-", width) .. "+"
--
--    -- Construct the padding by iterating through each line in the selection
--    local padding = {}
--    for i = start_row, end_row do
--        local line = vim.fn.getline(i)
--        local pad_line = "|" .. line:sub(start_col, end_col) .. "|"
--        table.insert(padding, pad_line)
--    end
--
--    -- Combine the border and padding strings to create the final box representation
--    local box_text = {border}
--    for _, line in ipairs(padding) do
--        table.insert(box_text, line)
--    end
--    table.insert(box_text, border)
--
--    -- Replace the selected text with the box representation
--    vim.fn.setreg(vim.v.register, table.concat(box_text, "\n"))
--
--    -- Move the cursor back to the original position
--    vim.cmd("normal! `<" .. start_col .. "l`>" .. end_col .. "l")
--end
--
--
--vim.keymap.set('v', '<leader>vd', ':lua VisualBlockBox()<CR>', {noremap = true})

--vim.go.ascii_default_hpadding = 1
--vim.go.ascii_default_vpadding = 1
--vim.go.ascii_hline_char = "-"
--vim.go.ascii_vline_char = "|"
--vim.go.ascii_corner_char = "+"
