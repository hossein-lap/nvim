--** neovim config **--
-- variables
HOME = os.getenv("HOME")
NHOME = HOME .. '/.config/nvim'
set = vim.opt
cmd = vim.cmd
api = vim.api
--key = vim.keymap.set

-- set <leader> key
vim.g.mapleader = '\\'

-- some options
set.termguicolors = true

---- some favorate colorschemes
--'hybrid_material'
--'sunbather'
--'dalton'
cmd 'colorscheme hybrid_material'

-- status line config
cmd 'source $HOME/.config/nvim/vim/simplestatus.vim'
-- netrw config
cmd 'source $HOME/.config/nvim/vim/netrw.vim'

---- modules
-- helper functions
require('functions')
-- main options
require('main')
-- ftype specific extra options
require('extra')
-- plugin manager
require('plugin')
-- lsp configs
require('lsp')
-- snipper manager configs
require('snippet')
-- to input templates
require('skel')
-- compile and execute programs
require('cp')
-- set the keybindings and shortcuts
require('keybind')
-- treesitter settings
require('treesitter')
