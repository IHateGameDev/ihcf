vim.cmd([[
  function! IHcreateFile
    lua require('ihcf').createFile()
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem("text": '(A)dd spec file node',
                                            \ "shortcut":'A',
                                            \ "callback": 'IHcreateFile')
]])
