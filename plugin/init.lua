vim.cmd([[
  function! IHCreateFile()
    lua require('ihcf').createFile(g:NERDTreeDirNode.path)
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem({
                                            \ 'text': '(A)dd file node whit ihfdl',
                                            \ 'callback': 'IHCreateFile',
                                            \ 'shortcut': 'A'})
]])
