" Name:       blud.vim
" Version:    0.1.0
" Maintainer: github.com/hossein-lap
" License:    The MIT License (MIT)
"
" A minimal orange colorscheme for Vim.
"
" Forked from sunbather:
" https://github.com/nikolvs/vim-sunbather
"
"""
hi clear

if exists('syntax on')
	  syntax reset
endif

" Toggle bold, italics, underline {{{
let g:fontfaces = 0

if g:fontfaces == 1
	  let s:thebold = 'bold'
	  let s:theitalic = 'italic'
	  let s:theurl = 'underline'
else
	  let s:thebold = 'none'
	  let s:theitalic = 'none'
	  let s:theurl = 'none'
endif
" }}}

let g:colors_name='suse'

let s:alpha_black     = { "gui": "NONE",    "cterm": "NONE" }
let s:black           = { "gui": "#000000", "cterm": "232"  }
let s:dark_white      = { "gui": "#cccccc", "cterm": "15"   }
let s:actual_white    = { "gui": "#ffffff", "cterm": "231"  }
let s:light_white     = { "gui": "#f1f1f1", "cterm": "15"   }
let s:subtle_black    = { "gui": "#121212", "cterm": "233"  }
let s:light_black     = { "gui": "#262626", "cterm": "235"  }
let s:lighter_black   = { "gui": "#4e4e4e", "cterm": "239"  }
let s:lightest_black  = { "gui": "#5e5e5e", "cterm": "239"  } 
let s:medium_gray     = { "gui": "#767676", "cterm": "243"  }
let s:actual_gray     = { "gui": "#989898", "cterm": "248"  }
let s:light_gray      = { "gui": "#a8a8a8", "cterm": "248"  }
let s:lighter_gray    = { "gui": "#c6c6c6", "cterm": "251"  }
let s:lightest_gray   = { "gui": "#eeeeee", "cterm": "255"  }
let s:darker_pink     = { "gui": "#d75f87", "cterm": "168"  }
let s:dark_pink       = { "gui": "#ff5f87", "cterm": "204"  }
let s:actual_pink     = { "gui": "#ff00aa", "cterm": "204"  }
let s:light_pink      = { "gui": "#ff77aa", "cterm": "204"  }
let s:darker_red      = { "gui": "#870000", "cterm": "88"   }
let s:dark_red        = { "gui": "#af0000", "cterm": "124"  }
let s:actual_red      = { "gui": "#d70000", "cterm": "160"  }
let s:debian_red      = { "gui": "#A80030", "cterm": "88"   }
let s:light_red       = { "gui": "#ff0000", "cterm": "196"  }
let s:dark_orange     = { "gui": "#da5000", "cterm": "166"  }
let s:actual_orange   = { "gui": "#ff7700", "cterm": "202"  }
let s:light_orange    = { "gui": "#ff9900", "cterm": "208"  }
let s:lighter_orange  = { "gui": "#ffbc00", "cterm": "208"  }
let s:light_cream     = { "gui": "#ffaf5f", "cterm": "208"  }
let s:darker_blue     = { "gui": "#0000aa", "cterm": "18"   }
let s:dark_blue       = { "gui": "#0022cc", "cterm": "12"   }
let s:actual_blue     = { "gui": "#0055ff", "cterm": "12"   }
let s:light_blue      = { "gui": "#0077ff", "cterm": "153"  }
let s:dark_cyan       = { "gui": "#00aaff", "cterm": "6"    }
let s:light_cyan      = { "gui": "#00ddff", "cterm": "14"   }
let s:dark_green      = { "gui": "#009900", "cterm": "34"   }
let s:actual_green    = { "gui": "#33cc33", "cterm": "76"   }
let s:light_green     = { "gui": "#66ff66", "cterm": "119"  }
let s:dark_purple     = { "gui": "#8e44ad", "cterm": "140"  }
let s:actual_purple   = { "gui": "#967fc4", "cterm": "140"  }
let s:light_purple    = { "gui": "#d6acff", "cterm": "140"  }
let s:light_yellow    = { "gui": "#ffff77", "cterm": "228"  }
let s:actual_yellow   = { "gui": "#fff800", "cterm": "11"   }
let s:dark_yellow     = { "gui": "#bbbb33", "cterm": "3"    }

let s:background = &background

if &background == "dark"
	let s:bg              = s:black
	let s:bg_subtle       = s:lighter_black
	let s:bg_very_subtle  = s:subtle_black
	let s:norm            = s:lighter_gray
	let s:norm_subtle     = s:medium_gray
	let s:pink            = s:light_pink
	let s:cyan            = s:light_cyan
	let s:green           = s:light_green
	let s:red             = s:light_red
	let s:yellow          = s:actual_yellow
	let s:blue            = s:light_blue
	let s:orange          = s:light_orange
	let s:purple          = s:light_purple
	let s:nontext         = s:light_black
	let s:cream           = s:light_cream
else
	let s:bg              = s:actual_white
	let s:bg_subtle       = s:light_gray
	let s:bg_very_subtle  = s:lightest_gray
	let s:norm            = s:light_black
	let s:norm_subtle     = s:medium_gray
	let s:pink            = s:dark_pink
	let s:cyan            = s:dark_cyan
	let s:green           = s:dark_green
	let s:red             = s:dark_red
	let s:yellow          = s:dark_yellow
	let s:orange          = s:dark_orange
	let s:purple          = s:dark_purple
	let s:nontext         = s:dark_white
	let s:cream           = s:dark_orange
endif

let s:active = s:actual_green
let s:dark_active = s:dark_green
let s:light_active = s:light_green
let s:visual = s:active

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
	execute "highlight" a:group
	  \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
	  \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
	  \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
	  \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
	  \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
	  \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
	  \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("PlainNormal",   {"bg": s:alpha_black, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
	 execute "set background=" . s:background
endif

call s:h("Cursor",      {"bg": s:active, "fg": s:norm })
call s:h("Comment",     {"fg": s:lightest_black, "gui": s:theitalic, "cterm": s:theitalic})

call s:h("String",      {"fg": s:actual_white})
call s:h("Number",      {"fg": s:light_red})
call s:h("Constant",    {"fg": s:norm})
hi! link Boolean          Constant
hi! link Float            Constant
"hi! link Number           Constant
"hi! link String           Constant
hi! link Character        Constant

call s:h("Identifier",  {"fg": s:norm})
hi! link Identifier       PlainNormal
hi! link Function         Identifier

call s:h("Statement",   {"fg": s:light_gray})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",    {"fg": s:norm, "cterm": s:thebold, "gui": s:thebold})

call s:h("PreProc",     {"fg": s:actual_gray})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",        {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",     {"fg": s:lightest_gray, "gui": s:theitalic})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": s:theurl, "cterm": s:theurl})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Todo",          {"fg": s:active, "gui": s:theurl, "cterm": s:theurl})
call s:h("SpecialKey",    {"fg": s:medium_gray})
call s:h("NonText",       {"fg": s:nontext})
call s:h("Directory",     {"fg": s:medium_gray})
call s:h("Error",         {"fg": s:actual_white, "bg": s:actual_red, "cterm": s:thebold})
call s:h("ErrorMsg",      {"fg": s:dark_red})
call s:h("IncSearch",     {"bg": s:active, "fg": s:light_black})
call s:h("Search",        {"bg": s:active, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": s:thebold, "gui": s:thebold})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:active, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:dark_active})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg, "fg": s:norm})
call s:h("Title",         {"fg": s:actual_white})
call s:h("Visual",        {"fg": s:black, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:actual_red})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:actual_green})
call s:h("DiffDelete",    {"fg": s:actual_red})
call s:h("DiffChange",    {"fg": s:actual_blue})
call s:h("DiffText",      {"fg": s:actual_yellow})
call s:h("SignColumn",    {"fg": s:actual_green})


if has("gui_running")
	call s:h("SpellBad",    {"gui": "italic", "cterm": "italic", "sp": s:light_gray})
	call s:h("SpellCap",    {"gui": "italic", "cterm": "italic", "sp": s:light_gray})
	call s:h("SpellRare",   {"gui": "italic", "cterm": "italic", "sp": s:light_gray})
	call s:h("SpellLocal",  {"gui": "italic", "cterm": "italic", "sp": s:light_gray})
else
	call s:h("SpellBad",    {"gui": "italic", "cterm": "italic", "fg": s:light_gray})
	call s:h("SpellCap",    {"gui": "italic", "cterm": "italic", "fg": s:light_gray})
	call s:h("SpellRare",   {"gui": "italic", "cterm": "italic", "fg": s:light_gray})
	call s:h("SpellLocal",  {"gui": "italic", "cterm": "italic", "fg": s:light_gray})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg})
call s:h("PmenuSel",      {"fg": s:bg,   "bg": s:active})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:bg,   "bg": s:active, "gui": s:thebold, "cterm": s:thebold})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_very_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:bg})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" Syntastic
call s:h("SyntasticWarningSign", {"fg": s:yellow})
call s:h("SyntasticWarning",     {"bg": s:yellow, "fg": s:black, "gui": s:thebold, "cterm": s:thebold})
call s:h("SyntasticErrorSign",   {"fg": s:red})
call s:h("SyntasticError",       {"bg": s:red, "fg": s:actual_white, "gui": s:thebold, "cterm": s:thebold})

" which-key.nvim
call s:h("WhichKey",          {"bg": s:bg, "fg": s:active, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeyDesc",      {"bg": s:bg, "fg": s:norm_subtle, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeySeparator", {"bg": s:bg, "fg": s:norm, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeyFloat",     {"bg": s:bg})
hi link WhichKeyGroup WhichKey

" Neomake
hi link NeomakeWarningSign	SyntasticWarningSign
hi link NeomakeErrorSign	SyntasticErrorSign

" ALE
hi link ALEWarningSign	SyntasticWarningSign
hi link ALEErrorSign	SyntasticErrorSign

" Signify, git-gutter
hi link SignifySignAdd              DiffAdd
hi link SignifySignDelete           DiffDelete
hi link SignifySignChange           DiffChange
hi link GitGutterAdd                DiffAdd
hi link GitGutterDelete             DiffDelete
hi link GitGutterChange             DiffChange
hi link GitGutterChangeDelete       DiffText
