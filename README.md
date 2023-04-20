# nvim

Hos's neovim config

Alright! Finally that day have came and I rewrote my `nvim` config with `lua`
:)

I've created some modules for specific type of works, and I did my best to
write them as modular as possible.

## Tree structure

+ [ftdetect](#ftdetect)
+ [lua](#lua)
    + [module](#module)
    + [plugin](#plugin)
        + [alpha](#alpha)
        + [cmp](#cmp)
        + [colorizer](#colorizer)
        + [gitsigns](#gitsigns)
        + [lsp](#lsp)
        + [lualine](#lualine)
        + [nvimtree](#nvimtree)
        + [symbols-outline](#symbols-outline)
        + [telescope](#telescope)
        + [treesitter](#treesitter)
        + [which-key](#which-key)
    + [scheme](#scheme)
+ [shots](#shots)

Let't me explain a little :)

## ftdetect

It can contain files to define new filetype for vim.
For example I've defined a new filetype called `sent` which is a suckless
presentation tool. The program igores everyline which begins with `#` so
that's the character for commenting. You get the idea.

## lua

All Lua codes, settings, configs, plugins, etc.. will be here.

### module

My custom configs are here as modules.

+ `main.lua`
    + Main settings
        + Show line-number
        + Enable relative number
        + Show Statusline
        + Tab width
        + Set spell language
        + etc..
+ `keybind.lua`
    + Some basic keybinds
        + Escape in term-mode
        + Toggle paste-mode
        + Toggle spell-check
        + Move into buffers
        + Comment/uncomment lines
        + Some git commands
+ `extra.lua`
    + Extra options
        + Autocmds (based on filetype, filename, BufEnter, etc..)
            + *e.g.* Insert spaces in Python files instead of tabs
        + Toggle autofill (auto-pair) `' " [ { (`
+ `skel.lua`
    + Import some templates from ready-to-use files
        + C
        + C++
        + Shell
        + Lua
        + Markdown
        + Groff (ms)
        + Python
        + LaTeX
        + R Markdown
        + Makefile
        + HTML
        + Lorem Ipsum dummy text (1-9 paragraphs)
+ `rce.lua`
    + This is a plugin that I wrote to Compile, Run, Debug and more.
    + All it do is to split window (also can be float) and run a command
      inside the new pane 
    + The command can be a shell to have a nice terminal open
+ `netrw.lua` (Disabled by default)
    + Some preferred options for built-in file explorer
    + Also a dirty function to Auto open/close `netrw`
+ `helper.lua` (Disabled by default)
    + Some common functions (as aliases) for having less code

### plugin

+ Plugin Manager
        + [packer](https://github.com/wbthomason/packer.nvim)
+ Plugins
    + LSP
        + [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    + Snippets
        + [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
        + [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
            + [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
            + [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
            + [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
            + [cmp-path](https://github.com/hrsh7th/cmp-path)
    + Go to definition
        + [nvim-gtd](https://github.com/hrsh7th/nvim-gtd)
    + Statusline
        + [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
    + File tree
        + [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
    + Programming Symbols
        + [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
    + More colors and diagnosis
        + [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    + Render Hex colors
        + [nvim-cololizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
    + Greetings
        + [alpha-nvim](https://github.com/goolord/alpha-nvim)
    + Git
        + [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
    + Show keymaps
        + [which-key.nvim](https://github.com/folke/which-key.nvim)
    + Icons
        + [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
    + Fuzzy finder tools
        + [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
        + [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
        + [lazygit.nvim](https://github.com/nvim-lua/plenary.nvim)
        + [ripgrep](https://github.com/BurntSushi/ripgrep)
        + [fd](https://github.com/sharkdp/fd)

### scheme

+ [ayu](https://github.com/Shatur/neovim-ayu)
+ [dracula](https://github.com/Mofiqul/dracula.nvim)
+ [tokyodark](https://github.com/tiagovla/tokyodark.nvim)
+ [256noir](https://github.com/hossein-lap/vim-256noir)
+ [sunbather](https://github.com/hossein-lap/vim-sunbather)
+ [paramount](https://github.com/hossein-lap/vim-paramount)
+ [lupper](https://github.com/hossein-lap/vim-lupper)
+ [octave](https://github.com/hossein-lap/vim-octave)

### shots

![alpha](shots/nvim.png)

![init-lua](shots/nvim-lua-md-treesitter.png)

![Floating Terminal](shots/floating-term.png)

## Dependencies

+ LSPs
    + C/C++
        + `clangd`
    + Python
        + `pyright`
        + `nodejs`, `npm` or `yarn`
        + Install both python and js modules
    + Bash
        + Note: it's disabled right now, but the config exists
        + `bash-language-server`
        + `nodejs`, `npm` or `yarn`
        + Install js module
    + Lua
        + `lua_ls` (`lua-language-server`)
    + LaTeX
        + `texlab`
    + Go
        + `gopls`
+ Clipboard
    + `xclip`
+ More fuzzy things (for git and Telescope)
    + `lazygit`

## ToDo

- [x] Run and Compile
- [x] Auto Complete `( { [ " '`
- [x] Write every custom plugins modular
- [ ] Complete the `README.md` file (in progress)


