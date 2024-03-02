local vim = vim

local paths = require("project-starter.paths")
local utils = require("project-starter.utils")
local run_command = require("project-starter.commands")
local options     = require("project-starter.options")


return {
    ["esp32"] = function(name)
        name  = name or vim.fn.input("Name: ")

        local path = paths["esp32"] or vim.fn.input("Path: ")
        if not utils.handle_invalid_path(path) then return nil end

        run_command.esp32(path, name)

        utils.change_nvim_directory(path .. name)
        return path .. name
    end,

    ["android"] = function (name)
        name  = name or vim.fn.input("Name: ")
        local package_name = options.jdk_app_package_name or vim.fn.input("App Package Name: ")

        local path = paths["android"] or vim.fn.input("Path: ")
        if not utils.handle_invalid_path(path) then return nil end

        run_command.android(path, name, package_name)

        utils.change_nvim_directory(path .. name)
        return path .. name
    end,

    ["c"] = function (name)
        name  = name or vim.fn.input("Name: ")
        local path = paths["c"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        run_command.c(path, name)

        utils.change_nvim_directory(path .. name)
        return path .. name
    end,

    ["cpp"] = function(name)
        name  = name or vim.fn.input("Name: ")
        local path = paths["cpp"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        run_command.cpp(path, name)

        utils.change_nvim_directory(path .. name)
        return path .. name
    end,

    ["java"] = function()
        local groupId = options.jdk_app_package_name or vim.fn.input("Group Id: ")
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


