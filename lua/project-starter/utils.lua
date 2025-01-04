local utils = {}

-- local socket = require("socket")
local options = require("project-starter.options")

utils.firstToUpper = function(str)
    return (str:gsub("^%l", string.upper))
end

utils.success = function(lang, path)
    lang = lang or nil
    path = path or nil

    if lang == nil then
        return
    end

    if path == nil then
        return
    end

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
        if path == nil then
            print("Path is nil")
        else
            print("Invalid path: '" .. path .. "'")
        end
        return false
    end

    return true
end

utils.get_implemented_languages = function ()
    local keyset = {}

    for k, v in pairs(require("project-starter.builders")) do
        table.insert(keyset, k)
    end

    return keyset
end

utils.get_implemented_languages_str = function ()
    local keyset = {}

    for k, v in pairs(require("project-starter.builders")) do
        table.insert(keyset, k)
    end

    local str = ""

    for i = 1, #keyset do
        str = str .. keyset[i] .. ", "
    end

    -- Check if the string is not empty before attempting to remove the last two characters
    if #str > 0 then
        return str:sub(1, -3)
    else
        return str
    end
end

-- utils.has_internet = function()
--     local test_host = "8.8.8.8" -- Google's public DNS
--     local test_port = 53        -- DNS port
--     local timeout = 2           -- Timeout in seconds
--
--     -- Try to create a TCP connection
--     local connection = socket.tcp()
--     connection:settimeout(timeout)
--
--     -- Attempt to connect to the test host
--     local result = connection:connect(test_host, test_port)
--     connection:close()
--
--     -- Return true if connection was successful
--     return result ~= nil
-- end


return utils
