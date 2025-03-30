vim.cmd([[
  function! s:createFile()
    let l:curNode = NERDTreeGetSelectedNode()
    lua require('ihcf').createFile(curNode.path)
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem('Add Spec File Node', 'createFile', 'A')
]])
