set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="spacedust"
hi Normal guifg=#f1f7d5 guibg=#00292f
hi Comment guifg=#d1886d guibg=NONE
hi Constant guifg=#e9d47f guibg=NONE
hi String guifg=#53bf96 guibg=NONE
hi htmlTagName guifg=#fb7900 guibg=NONE
hi Identifier guifg=#fb7900 guibg=NONE
hi Statement guifg=#e9d47f guibg=NONE
hi PreProc guifg=#e9d47f guibg=NONE
hi Type guifg=#fb7900 guibg=NONE
hi Function guifg=#f1f7d5 guibg=NONE
hi Repeat guifg=#e9d47f guibg=NONE
hi Operator guifg=#f1f7d5 guibg=NONE
hi Error guibg=#ff0000 guifg=#ffffff
hi TODO guibg=#0011ff guifg=#ffffff
hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special