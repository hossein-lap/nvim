--** neovim config **--
-- variables
HOME = os.getenv("HOME")
NHOME = HOME .. '/.config/nvim'
set = vim.opt
cmd = vim.cmd
--key = vim.keymap.set

-- some options
set.termguicolors = true

cmd 'colorscheme hybrid_material'
set.termguicolors = true

cmd 'source $HOME/.config/nvim/vim/status.vim'

-- modules
require('functions')
require('main')
require('keybind')
require('extra')
require('plugin')
require('lsp')
require('snippet')
require('skel')
require('cp')
