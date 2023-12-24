local M = {}
local vim = vim

local builders = require("project-starter.builders")
local paths = require("project-starter.paths")
local options = require("project-starter.options")

---@param opts table
M.setup = function (opts)
    opts = opts or {}

    if opts.default_paths then
        if opts.default_paths.java then
            paths.java = opts.default_paths.java
        end
        if opts.default_paths.cpp then
            paths.cpp = opts.default_paths.cpp
        end
        if opts.default_paths.java then
            paths.nvim_plugins = opts.default_paths.nvim_plugins
        end
        if opts.default_paths.python then
            paths.python = opts.default_paths.python
        end
    end

    if opts.cd then
        options.cd = opts.cd
    end
end

---@param lang string 
M.create_project = function (lang)
    lang = lang or "nil"
    local builder = builders[lang]
    if builder then
        builder()
    else
        print("Unsupported language: \'" .. lang .. "\'")
    end
end

vim.api.nvim_create_user_command(
    'CreateProject',
    function (args)
        local arguments = {}
        for word in args.args:gmatch("%w+") do table.insert(arguments, word) end

        if arguments == {} then
            print("At least one argument is needed (cpp, java, swing, nvim_plugin)")
            return nil
        end

        M.create_project(arguments[1])
    end,
    { desc = "Create a template project", nargs = '?' }
)


return M
