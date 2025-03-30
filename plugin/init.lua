vim.cmd([[
  function! s:createFile
    lua requier('ihcf').createFile()
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem("text": '(A)dd spec file node',
                                            \ "shortcut":'A',
                                            \ "callback": 'ihCreateFile')
]])
