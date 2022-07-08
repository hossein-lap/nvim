--** neovim config **--
-- helper functions module
require('helper')

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

-- main options
require('main')

-- ftype specific extra options
require('extra')

-- plugin manager
require('plugins')

-- lsp configs
require('plugins.lsp')

-- snipper manager configs
require('plugins.snippet')

-- to input templates
require('skel')

-- compile and execute programs
require('cexecute')

-- set the keybindings and shortcuts
require('keybind')

-- treesitter settings
require('plugins.treesitter')
