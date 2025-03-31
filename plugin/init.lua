vim.cmd([[
  function! IHCreateFile()
    let curDir = g:NERDTreeDirNode.GetSelected().path
    lua require('ihcf').createFile(curDir)
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem({
                                            \ 'text': '(A)dd file node whit ihfdl',
                                            \ 'callback': 'IHCreateFile',
                                            \ 'shortcut': 'A'})
]])
