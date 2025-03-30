vim.cmd([[
  function! s:createFile()
    let l:curNode = NERDTreeGetSelectedNode()
    lua require('ihcf').createFile(curNode.path)
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem({
                                            \ 'text': 'Add Spec File Node',
                                            \ 'callback': 'createFile',
                                            \ 'shortcut': 'A'})
]])
