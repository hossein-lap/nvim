--** neovim config **--
-- helper functions module
require('helper')

-- some options
set.termguicolors = true

---- some favorate colorschemes
--'hybrid_material'
--'sunbather'
--'dalton'
cmd 'colorscheme tokyodark'
--cmd 'colorscheme onehalfdark'
--require('onedark').load()
--require('onedark').setup {
    --style = 'warmer'
--}

-- status line config
--cmd 'source $HOME/.config/nvim/vim/simplestatus.vim'
--cmd 'source $HOME/.config/nvim/vim/status.vim'
-- netrw config
--cmd 'source $HOME/.config/nvim/vim/netrw.vim'
-- miniSnip
--cmd 'source $HOME/.config/nvim/vim/snippet.vim'

-- main options
require('main')

-- ftype specific extra options
require('extra')

-- to input templates
require('skel')

-- compile and execute programs
require('cexecute')

-- set the keybindings and shortcuts
require('keybind')

-- Plugins {{{
-- packer plugin-manager
require('plugins')

-- lsp configs
require('plugins.lsp')

-- Snippet Manager Configs
require('plugins.cmp')

-- Colorizer Plugin
require('plugins.colorizer')

-- Floating terminal
require('plugins.nvterm')

-- Lualine [status line]
require('plugins.lualine')

-- Colorscheme
require('plugins.tokyodark')

-- NvimTree
require('plugins.ntree')

---- Treesitter Settings
require('plugins.treesitter')
-- }}}
