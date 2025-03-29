local ihcf = {}

function ihcf.create_file_with_content()
  local filetype = vim.fn.input("Enter C file type (S/SFR): ")
  local filename = vim.fn.input("Enter C file name: ")
  local modulename = vim.fn.input("Enter C module name (leave empty for no use module): ")

  local ext = "h"
  local content = ""

  local macmodext = modulename ~= "" and modulename:upper() .. "_" or ""
  local fnmodext = modulename:lower()

  local submodname = macmodext .. filename:upper() .. "_H"
  local submodstart = "#ifndef " .. submodname .. "\n#define " .. submodname .. "\n\n"
  local submodend = "#endif // " .. submodname

  local filesets = vim.split(filetype, ":")

  if filesets[1] == "S" then
    content = submodstart ..
              "typedef struct {\n\n} " .. modulename .. filename .. ";\n\n"

    for i = 2, #filesets do
      if filesets[i] == "i" then
        content = content .. "API void " .. fnmodext .. filename .. "Init(" .. modulename .. filename .. "* this);\n\n"
      elseif filesets[i] == "c" then
        content = content .. "API " .. modulename .. filename .. " " .. fnmodext .. filename .. "Create();\n\n"
      elseif filesets[i] == "n" then
        content = content .. "API " .. modulename .. filename .. "* " .. fnmodext .. filename .. "New();\n\n"
      end
    end

    content = content .. submodend

  elseif filesets[1] == "SFR" then
    ext = "c"
    content = "#include \"" .. filename .. ".h\"\n\n"

    for i = 2, #filesets do
      if filesets[i] == "i" then
        content = content .. "API void " .. fnmodext .. filename .. "Init(" .. modulename .. filename .. "* this) {\n\n}\n\n"
      elseif filesets[i] == "c" then
        content = content .. "API " .. modulename .. filename .. " " .. fnmodext .. filename .. "Create() {\n\n}\n\n"
      elseif filesets[i] == "n" then
        content = content .. "API " .. modulename .. filename .. "* " .. fnmodext .. filename .. "New() {\n\n}\n\n"
      end
    end
  else
    print("Invalid file type specified!")
    return
  end

  local full_path = vim.fn.expand("%:p:h") .. "/" .. filename .. "." .. ext

  local file = io.open(full_path, "w")

  if file then
    file:write(content)
    file:close()
    print("File created: " .. full_path)
    vim.cmd("edit " .. full_path)
  else
    print("Failed to create file!")
  end
end

if is_vim then return ihcf end

vim.cmd([[
  function! ihCreateFile()
    lua require('ihcf').create_file_with_content()
    endfunction
  call NERDTreeAddMenuItem('(A)dd spec file node', 'A', 'ihCreateFile')
]])

return ihcf
