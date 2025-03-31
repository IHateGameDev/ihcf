vim.cmd([[
  function! IHCreateFile()
    let curDir = g:NERDTreeDirNode.GetSelected().path.str()
    call luaeval('require("ihcf").createFile(_A)', curDir)
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem({
                                            \ 'text': '(A)dd file node whit ihfdl',
                                            \ 'callback': 'IHCreateFile',
                                            \ 'shortcut': 'A'})
]])
