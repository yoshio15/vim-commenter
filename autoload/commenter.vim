" 現在行をコメントアウトする(Vim script用)
function! g:commenter#ToggleComment()
  let l:i = indent('.')
  let l:line = getline('.')
  let l:cur_row = getcurpos()[1]
  let l:cur_col = getcurpos()[2]
  let l:prefix = l:i > 0 ? l:line[:l:i - 1] : '' " インデントがない場合
  if l:line[l:i:l:i + len(g:commenter#comment_str) - 1] == g:commenter#comment_str
    call setline('.', l:prefix . l:line[l:i + len(g:commenter#comment_str):])
    let l:cur_offset = -len(g:commenter#comment_str)
  else
    call setline('.', l:prefix . g:commenter#comment_str . l:line[l:i:])
    let l:cur_offset = len(g:commenter#comment_str)
  endif
  call cursor(l:cur_row, l:cur_col + l:cur_offset)
endfunction
