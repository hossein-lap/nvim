" let l:vimwiki_fold_blank_lines = 0  " set to 1 to fold blank lines
" let l:vimwiki_header_type = '#'     " set to '=' for wiki syntax
" setlocal foldlevel=1
" setlocal foldenable
" setlocal foldmethod=expr
" setlocal foldexpr=Fold(v:lnum)
"
" function! Fold(lnum)
" 	let fold_level = strlen(matchstr(getline(a:lnum), '^' . l:vimwiki_header_type . '\+'))
" 	if (fold_level)
" 		return '>' . fold_level  " start a fold level
" 	endif
" 	if getline(a:lnum) =~? '\v^\s*$'
" 		if (strlen(matchstr(getline(a:lnum + 1), '^' . l:vimwiki_header_type . '\+')) > 0 && !g:vimwiki_fold_blank_lines)
" 			return '-1' " don't fold last blank line before header
" 		endif
" 	endif
" 	return '=' " return previous fold level
" endfunction
