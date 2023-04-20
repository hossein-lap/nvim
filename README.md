# nvim

Hos's neovim config

Alright! Finally that day have came and I rewrote my `nvim` config with `lua`
:)

I've created some modules for specific type of works, and I did my best to
write them as modular as possible.

## Dependencies

+ Plugin Manager: [packer](github.com/wbthomason/packer.nvim)
+ Plugins:
    + LSP: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    + Snippets: [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
        + [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
            + [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
            + [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
            + [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
            + [cmp-path](https://github.com/hrsh7th/cmp-path)
    + Go to definition: [nvim-gtd](https://github.com/hrsh7th/nvim-gtd)
    + Statusline: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
    + File tree: [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
    + Programming Symbols: [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
    + More colors and diagnosis: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    + Render Hex colors: [nvim-cololizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
    + Greetings: [alpha-nvim](https://github.com/goolord/alpha-nvim)
    + Git: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
    + Show keymaps: [which-key.nvim](https://github.com/folke/which-key.nvim)
    + Icons: [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
    + Fuzzy finder tools: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
        + [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
        + [lazygit.nvim](https://github.com/nvim-lua/plenary.nvim)
        + [ripgrep](https://github.com/BurntSushi/ripgrep)
        + [fd](https://github.com/sharkdp/fd)
+ Colorschemes:
    + [ayu](https://github.com/Shatur/neovim-ayu)
    + [dracula](https://github.com/Mofiqul/dracula.nvim)
    + [tokyodark](https://github.com/tiagovla/tokyodark.nvim)
    + [256noir](https://github.com/hossein-lap/vim-256noir)
    + [sunbather](https://github.com/hossein-lap/vim-sunbather)
    + [paramount](https://github.com/hossein-lap/vim-paramount)
    + [lupper](https://github.com/hossein-lap/vim-lupper)
    + [octave](https://github.com/hossein-lap/vim-octave)
+ LSPs:
    + C/C++: `clangd`
    + Python: `pyright`
        + `nodejs`, `npm` or `yarn`
        + Install both python and js modules
    + Bash: `bash-language-server`
        + Note: it's disabled right now, but the config exists
        + `nodejs`, `npm` or `yarn`
        + Install js module
    + Lua: `lua_ls` (`lua-language-server`)
    + LaTeX: `texlab`
    + Go: `gopls`
+ `xclip`
+ `lazygit`
    + 

## Modules

#### Keep that in mind

This module have to be the **first** module you call, because others have
dependencies on this one.

### Main

This module sets very basic configuration for `nvim`.

Things like:

- Line numbering
- Wrap lines
- Highlight current line
- Set spell check language(s)
- etc...

### Keybind

Contains keybindings for:

- Add/Remove comment [`-`, `+`]
- Compile/Execute programs [`<leader>fw`, `<leader>fe`]
- Enable/Disable **paste** mode [`<C-p>`]
- Enable/Disable **spell check** [`<leader>ss`]
- etc...

### Extra

It adds some extra features like:

- Insert actual <tab> instead of spaces on
    some specific filetypes.
- Make sure to insert spaces instead of <tab>
    on some space-sensitive languages.
- A function to toggle auto-fill `' " { [ (` chars
    and enable the auto-fill for some filetypes.
    - Also auto-fill `_` and `*` for `makrdown` and `rmarkdown` files.

### Skel

If you want to set the leader key [or anything] to `,`
note that I have `,` set to **read some template files located in
`$HOME/.config/nvim/templates/` directory to the current file**.

### cp

#### Screenshot

![alpha](shots/nvim.png)

![init-lua](shots/nvim-lua-md-treesitter.png)

![Floating Terminal](shots/floating-term.png)

#### ToDo

- [x] Run and Compile
- [x] Auto Complete `( { [ " '`
- [x] Write every custom plugins modular
- [ ] Complete the `README.md` file (in progress)


