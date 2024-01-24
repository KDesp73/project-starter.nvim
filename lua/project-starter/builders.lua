local vim = vim

local paths = require("project-starter.paths")
local utils = require("project-starter.utils")
local run_command = require("project-starter.commands")


return {
    ["cpp"] = function(name)
        name  = name or vim.fn.input("Name: ")
        local path = paths["cpp"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        run_command.cpp(path, name)

        utils.change_nvim_directory(path .. name)
        return path .. name
    end,

    ["java"] = function()
        local groupId = vim.fn.input("Group Id: ")
        local artifactId = vim.fn.input("Artifact Id: ")
        local path = paths["java"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        run_command.java(path, groupId, artifactId)

        utils.change_nvim_directory(path .. artifactId)

        return path .. artifactId
    end,

    ["swing"] = function (name)
        name  = name or vim.fn.input("Name: ")
        local path = paths["java"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        run_command.swing(path, name)

        utils.change_nvim_directory(path .. name)

        return path .. name
    end,


    ["nvimplugin"] = function (name)
        name  = name or vim.fn.input("Name: ")
        local path = paths["nvimplugin"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        run_command.nvimplugin(path, name)

        utils.change_nvim_directory(path .. name)

        return path .. name
    end,

    ["python"] = function (name)
        name = name or vim.fn.input("Name: ")
        local path = paths["python"]

        if not utils.handle_invalid_path(path) then return nil end

        run_command.python(path, name)

        utils.change_nvim_directory(path .. name)

        return path .. name
    end,

    ["ruby"] = function(name)
        name = name or vim.fn.input("Name: ")
        local path = paths["ruby"]

        if not utils.handle_invalid_path(path) then return nil end

        run_command.ruby(path, name)

        utils.change_nvim_directory(path .. name)

        return path .. name
    end
}


