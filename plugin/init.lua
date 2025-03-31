vim.cmd([[
  function! IHCreateFile()
    let curDir = g:NERDTreeDirNode.GetSelected().path
    let path = join(curDir, '/')
    call luaeval('require("ihcf").createFile(_A)', path)
  endfunction

  autocmd VimEnter * call NERDTreeAddMenuItem({
                                            \ 'text': '(A)dd file node whit ihfdl',
                                            \ 'callback': 'IHCreateFile',
                                            \ 'shortcut': 'A'})
]])
