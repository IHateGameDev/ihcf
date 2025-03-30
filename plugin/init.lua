vim.cmd([[
  function! IHCreateFile()
    let l:curNode = NERDTreeGetSelectedNode()
    lua require('ihcf').createFile(curNode.path)
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem({
                                            \ 'text': '(A)dd file node whit ihfdl',
                                            \ 'callback': 'IHCreateFile',
                                            \ 'shortcut': 'A'})
]])
