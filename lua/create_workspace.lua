local available_languages = {
  c = function(project_name)
    -- make directories
    vim.cmd "!mkdir -pv src lib third_party"

    -- get cmake template
    local home = os.getenv("HOME")
    local file = io.open(home .. "/.config/nvim/lua/file_templates/CMAKE_C_TEMPLATE.txt", "r")
    local file_contents = file:read("*all")
    file:close()

    -- format with project name
    file_contents = string.gsub(file_contents, "{PROJECT_NAME}", project_name)

    -- write
    file = io.open("CMakeLists.txt", "w")
    if not file then return end
    file:write(file_contents)
    file:close()

    -- get main.c template
    file = io.open(home .. "/.config/nvim/lua/file_templates/MAIN_C.txt", "r")
    if not file then return end
    file_contents = file:read("*all")
    file:close()

    -- write it to the new directory
    file = io.open("src/main.c", "w")
    if not file then return end
    file:write(file_contents)
    file:close()
  end,
  cpp = function(project_name)
    -- make directories
    vim.cmd "!mkdir -pv src lib third_party"

    -- get cmake template
    local home = os.getenv("HOME")
    local file = io.open(home .. "/.config/nvim/lua/file_templates/CMAKE_CPP_TEMPLATE.txt", "r")
    local file_contents = file:read("*all")
    file:close()

    -- format with project name
    file_contents = string.gsub(file_contents, "{PROJECT_NAME}", project_name)

    -- write
    file = io.open("CMakeLists.txt", "w")
    if not file then return end
    file:write(file_contents)
    file:close()

    -- get main.c template
    file = io.open(home .. "/.config/nvim/lua/file_templates/MAIN_CPP.txt", "r")
    if not file then return end
    file_contents = file:read("*all")
    file:close()

    -- write it to the new directory
    file = io.open("src/main.cpp", "w")
    if not file then return end
    file:write(file_contents)
    file:close()
  end
}

function CreateWorkspace(language, project_name)
  language = string.lower(language)
  project_name = string.gsub(project_name, "%s+", "")
  if not available_languages[language] then
    print("language not available!")
    return
  end

  available_languages[language](project_name)

  os.execute("git init")
end

function string.split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

vim.api.nvim_create_user_command(
  "Cpwk",
  function(opt)
    local args = opt.args
    args = string.split(opt.args, ' ')
    CreateWorkspace(args[1], args[2])
  end,
  { bang = true, nargs = '*' }
)
