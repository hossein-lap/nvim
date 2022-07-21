require("nvterm").setup({
  terminals = {
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.25,
        col = 0.2,
        width = 0.6,
        height = 0.5,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .5, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = false,
    auto_insert = false,
  },
})

----

local terminal = require("nvterm.terminal")

local ft_cmds = {
  python = "python3 " .. vim.fn.expand('%'),
  lua = "lua " ..  vim.fn.expand('%'),
  tex = 'xelatex ' ..  vim.fn.expand('%'),
  c = 'gcc -o ' .. Expand("%:r") .. ' -Wall ' .. Expand("%"),
  cpp = 'g++ -o ' .. Expand("%:r") .. ' ' .. Expand("%"),
  --c = 'gcc -o ' .. Expand("%:r") .. ' -Wall ' .. Expand("%")
}
local toggle_modes = {'n', 't'}

local mappings = {
  { 'n', '<leader>tf', function () terminal.send(ft_cmds[vim.bo.filetype], 'vertical') end },
  --{ toggle_modes, '<leader>th', function () require("nvterm.terminal").toggle('horizontal') end },
  --{ toggle_modes, '<leader>tv', function () require("nvterm.terminal").toggle('vertical') end },
  { toggle_modes, '<leader>tt', function () terminal.toggle('float') end },
  { 'n', '<leader>qt', function () terminal.send(ft_cmds[vim.bo.filetype] .. '<C-w>w', 'float') end },
}

local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
