set tabstop=4 shiftwidth=4
set smartindent
set nowrap

set number
highlight LineNr ctermfg=grey

nnoremap i <Up>
nnoremap k <Down>
nnoremap j <Left>
nnoremap {<Enter> {<Enter> <Enter>}<Esc>k$xi<Right>


if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= '  '
             let s .= '[' . i . (getbufvar(buflist[winnr - 1], "&mod")?'*':'') . ']'
"             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[Untitled]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif



