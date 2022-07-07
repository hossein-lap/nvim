--** neovim config **--
-- variables
HOME = os.getenv("HOME")
NHOME = HOME .. '/.config/nvim'
set = vim.opt
cmd = vim.cmd
api = vim.api

-- <leader> key
vim.g.mapleader = '\\'

--key = vim.keymap.set

-- some options
set.termguicolors = true

--cmd 'colorscheme hybrid_material'
--cmd 'colorscheme sunbather'
cmd 'colorscheme hos'
--cmd 'colorscheme dalton'

set.termguicolors = true

cmd 'source $HOME/.config/nvim/vim/status.vim'
cmd 'source $HOME/.config/nvim/vim/netrw.vim'

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
