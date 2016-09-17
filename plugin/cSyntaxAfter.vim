" File: cSyntaxAfter.vim
" Author: Sergey Vlasov <sergey@vlasov.me>
" Last Change: 2015-03-10
" Version: 0.3
""
" This plugin was initially created for codeblock_dark color theme to
" highlight operators (+ - / * = <> () and others) in C-like languages.
" Why it's needed? Well, by default vim doesn't do that. After switching
" from Code::Block to vim I got really missed it.
"
" Then the plugin grew into something bigger. I started to use it to unify
" overal syntax highlighting for C-like languages.
"
" There are two ways to enable the plugin:
"
"   1. If you want to use CSyntaxAfter highlighting as is, put this into your
"   .vimrc:
"
"      autocmd! FileType c,cpp,java,php call CSyntaxAfter()
"
"   2. If you also want to extend the highlighting or add other C-like languages
"   support (Java, Go etc), create a corresponding <filetype>.vim file in
"   .vim/after/syntax/ and call CSyntaxAfter() from there instead.
"
"   WARNING: For same file type use either option (1.) or (2.), basically avoid calling
"   CSyntaxAfter() more than once.
"
"   For example, to distinguish "++" and "--" operator from "+" and "-" in C and C++,
"   remove "c" and "cpp" from autocmd above and instead create .vim/after/syntax/c.vim
"   with (cpp syntax is based on c):
"
"      if exists("*CSyntaxAfter")
"         call CSyntaxAfter()
"      endif
"
"      syntax match longOperators "++\|--"
"      hi longOperators guifg=green guibg=red
"

function! CSyntaxAfter()

	"====================================================
	" Highlight All Function
	" ===================================================
	
	syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
	syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
	" hi cFunction cterm=bold ctermfg=blue
	
	"===================================================
	" Highlight All Class Name
	" ==================================================
	
	syn match cClassName "\<[a-zA-Z_][a-zA-Z_0-9]*\>*\:"me=e-1
	" hi cClassName cterm=bold ctermfg=yellow
	
	"====================================================
	" Highlight All Math Operator
	" ===================================================
	
	" c math operators
	syn match cMathOperator display "[-+\*\%=]"
	
	" c math brackets
	"syn match cBrackets display "[{}()]" not working yet??!!
	
	" c opinter operators
	syn match cPointerOperator display "->\|\.\|\:\:"
	
	" c logical operators - boolean results
	syn match cLogicalOperator display "[!<>]=\="
	syn match cLogicalOperator display "=="
	
	" c bit operators
	syn match cBinaryOperator display "\(&\||\|\^\|<<\|>>\)=\="
	syn match cBinaryOperator display "\~"
	syn match cBinaryOperatorError display "\~="
	
	" More c logical operators - highlight in preference to binary
	syn match cLogicalOperator display "&&\|||"
	syn match cLogicalOperatorError display "\(&&\|||\)="
	
	" more c priority operators -highlight in preference to binary
	syn match cPriorityOpreator display "(\|)\|\[\|\]\|{\|}"
	
	" match operator
	" hi cMathOperator ctermfg=blue
	" hi cPointerOperator ctermfg=red
	" hi cLogicalOperator ctermfg=yellow
	" hi cBinaryOperator ctermfg=5
	" hi cBinaryOperatorError ctermfg=red
	" hi cLogicalOperator ctermfg=yellow
	" hi cLogicalOperatorError ctermfg=yellow
	" hi cPriorityOpreator ctermfg=6
        " hi link _Operator Operator
endfunction

