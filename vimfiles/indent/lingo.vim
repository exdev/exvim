" Vim indent file
" Language:    Lingo
" Maintainer:  Yu Jianrong
" Created:     2008 Sep 4
" Last Change: 


if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal indentexpr=GetLingoIndent(v:lnum)
setlocal indentkeys=:,o,O,e,=end,=repeat,=case,=on,=if,=else,=then,=:,=-- 

if exists("*GetLingoIndent")
	finish
endif


function! s:GetPrevNonCommentLineNum( line_num )

	" Skip lines starting with a comment
	let SKIP_LINES = '^\s*--'

	let nline = a:line_num
	while nline > 0
		let nline = prevnonblank(nline-1)
		if getline(nline) !~? SKIP_LINES
			break
		endif
	endwhile

	return nline
endfunction

function! s:GetLingoIndent( line_num )
	let nline = a:line_num
	while nline > 1
		if getline(nline-1) !~? '.*\\\s*$'
			break
		endif
        let nline = nline -1
	endwhile
    return indent(nline)
endfunction


function! GetLingoIndent( line_num )
	" Line 0 always goes at column 0
    if a:line_num == 0
        return 0
    endif

    let this_codeline = substitute( getline( a:line_num ), "--.*","","")

    let prev_codeline_num = s:GetPrevNonCommentLineNum( a:line_num )
    let prev_codeline = substitute( getline( prev_codeline_num ) , "--.*","","")
    let indnt = s:GetLingoIndent( prev_codeline_num )

    if this_codeline =~? '^\s*\<end\>\s\+\<case\>'
        if prev_codeline =~? '^\s*\<case\>'
            return indnt
        else if prev_codeline =~? ':\s*$'
            return indnt - &shiftwidth
        else
            return indnt - &shiftwidth*2
        endif
    endif

    if this_codeline =~? '^\s*\<end\>\s\+\<repeat\>'
        if prev_codeline =~? '^\s*\<repeat\>'
            return indnt
        else
            return indnt - &shiftwidth
        endif
    endif

    if this_codeline =~? '^\s*\<end\>\s\+\<if\>' || this_codeline =~? '^\s*\<else\>'
        if prev_codeline =~? '^\s*\<\(if\|else\)\>'
            return indnt
        else
            return indnt - &shiftwidth
        endif
    endif

    if this_codeline =~? '^\s*\<end\>'
        if prev_codeline =~? '^\s*\<on\>'
            return indnt
        else
            return indnt - &shiftwidth
        endif
    endif


    if this_codeline =~? ':\s*$'
        if prev_codeline =~? '^\s*\<case\>'
            return indnt + &shiftwidth
        else if prev_codeline =~? ':\s*$'
            return indnt
        else
            return indnt - &shiftwidth
        endif
    endif

    if prev_codeline =~? '^\s*\<\(repeat\|on\)\>' || prev_codeline =~? '^\s*\<if\>.*\<then\>\s*$' || prev_codeline =~? '^\s*\<else\>\s*$' || prev_codeline =~? '^\s*\<else\>\s*\<if\>.*\<then\>\s*$'
        return indnt + &shiftwidth
    endif

    if prev_codeline =~? ':\s*$'
        return indnt + &shiftwidth
    endif

    if prev_codeline =~ '.*\\\s*$'
        return indnt + &shiftwidth
    endif

	return indnt
endfunction

