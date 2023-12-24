local utils = {}

local options = require("project-starter.options")

utils.firstToUpper = function(str)
    return (str:gsub("^%l", string.upper))
end

utils.success = function(lang, path)
    lang = lang or "nil"
    path = path or "nil"

    print(utils.firstToUpper(lang) .. " project successfully created at: \'" .. path .. "\'")
end


utils.exists =  function(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

utils.isdir = function(path)
   -- "/" works on both Unix and Windows
   return utils.exists(path.."/")
end

utils.change_nvim_directory = function(path)
    if options.cd then
        vim.cmd("cd " .. path)

        -- TODO: Change directory on neotree too
        -- if package.loaded['nvim-tree'] then
        --     require("nvim-tree")
        -- end
    end
end

utils.handle_invalid_path = function(path)
    local ok, err = utils.isdir(path)
    if not ok then
        print("Invalid path")
        return false
    end

    return true
end

return utils
