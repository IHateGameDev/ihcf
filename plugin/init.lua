vim.cmd([[
  function! s:createFile()
    lua require('ihcf').createFile()
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem('Add Spec File Node', 'A', 'createFile')
]])
