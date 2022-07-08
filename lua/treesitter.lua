-- config
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "python", "lua", "rust", "bash" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

------ Users of packer.nvim have reported that when using treesitter for folds, they
------ sometimes receive an error "No folds found", or that treesitter highlighting
------ does not apply. A workaround for this is to set the folding options in an
------ autocmd:
--vim.api.nvim_create_autocmd({'BufEnter','ButAdd','BufNew','BufNewFile','BufWinEnter'}, {
  --group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  --callback = function()
    --vim.opt.foldmethod     = 'expr'
    --vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--end
--})
