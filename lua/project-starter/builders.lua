local vim = vim

local paths = require("project-starter.paths")
local utils = require("project-starter.utils")


return {
    ["cpp"] = function(name)
        name  = name or vim.fn.input("Name: ")
        local path = paths["cpp"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        vim.cmd(":silent !cd ".. path .. " && " .. "git clone https://github.com/KDesp73/CPP-Project-Template " .. name)

        utils.change_nvim_directory(path .. name)
        return path .. name
    end,

    ["java"] = function()
        local groupId = vim.fn.input("Group Id: ")
        local artifactId = vim.fn.input("Artifact Id: ")
        local path = paths["java"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        local command = "mvn archetype:generate -DgroupId=" .. groupId .. " -DartifactId=" .. artifactId .. " -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false"

        vim.cmd(":silent !cd " .. path .. " && " .. command)

        utils.change_nvim_directory(path .. artifactId)

        return path .. artifactId
    end,

    ["swing"] = function (name)
        name  = name or vim.fn.input("Name: ")
        local path = paths["java"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        vim.cmd(":silent !cd ".. path .. " && " .. "git clone https://github.com/KDesp73/swing-gui-starter " .. name)

        utils.change_nvim_directory(path .. name)

        return path .. name
    end,


    ["nvim_plugin"] = function (name)
        name  = name or vim.fn.input("Name: ")
        local path = paths["nvim_plugin"] or vim.fn.input("Path: ")

        if not utils.handle_invalid_path(path) then return nil end

        vim.cmd(":silent !cd " .. path .. " && " .. "git clone https://github.com/KDesp73/plugin-template.nvim " .. name)

        utils.change_nvim_directory(path .. name)

        return path .. name
    end,

    ["python"] = function (name)
        name = name or vim.fn.input("Name: ")
        local path = paths["python"]

        if not utils.handle_invalid_path(path) then return nil end

        vim.cmd(":silent !cd " .. path .. " && " .. "git clone https://github.com/KDesp73/python-starter.git " .. name)

        utils.change_nvim_directory(path .. name)

        return path .. name
    end
}


