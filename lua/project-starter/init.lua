local M = {}
local vim = vim

local builders = require("project-starter.builders")
local paths = require("project-starter.paths")
local options = require("project-starter.options")
local utils = require("project-starter.utils")

---@param opts table
M.setup = function (opts)
    opts = opts or {}

    if opts.default_paths then
        if opts.default_paths.c then
            paths.c = opts.default_paths.c
        end
        if opts.default_paths.cpp then
            paths.cpp = opts.default_paths.cpp
        end
        if opts.default_paths.java then
            paths.java = opts.default_paths.java
        end
        if opts.default_paths.nvimplugin then
            paths.nvimplugin = opts.default_paths.nvimplugin
        end
        if opts.default_paths.python then
            paths.python = opts.default_paths.python
        end
        if opts.default_paths.ruby then
            paths.ruby = opts.default_paths.ruby
        end
        if opts.default_paths.android then
            paths.android = opts.default_paths.android
        end
        if opts.default_paths.esp32 then
            paths.esp32 = opts.default_paths.esp32
        end
        if opts.default_paths.go then
            paths.go = opts.default_paths.go
        end
    end

    if opts.cd ~= nil then
        options.cd = opts.cd
    end

    if opts.jdk_app_package_name ~= nil then
        options.jdk_app_package_name = opts.jdk_app_package_name
    end

    return opts
end

---@param lang string 
M.create_project = function (lang, name)
    lang = lang or "nil"
    local builder = builders[lang]
    if builder then
        local path = builder(name)
        utils.success(lang, path)
    else
        print("Unsupported language: \'" .. lang .. "\'")
    end
end

vim.api.nvim_create_user_command(
    'CreateProject',
    function (args)
        local arguments = {}
        for word in args.args:gmatch("[%w%-_.]+") do table.insert(arguments, word) end

      if #arguments == 0 then
            print("At least one argument is needed (" .. utils.get_implemented_languages_str() .. ")")
            return nil
        end

        M.create_project(arguments[1], arguments[2])
    end,
    {
        desc = "Create a template project",
        nargs = 1,
        complete = function(arglead)
            local commands = utils.get_implemented_languages()

            local results = {}
            for _, v in pairs(commands) do
                if v:match(arglead) then
                    table.insert(results, v)
                end
            end

            return results
        end
    }
)

return M
