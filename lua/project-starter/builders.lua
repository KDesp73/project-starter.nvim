local vim = vim

local paths = require("project-starter.paths")
local options = require("project-starter.options")

return {
    ["cpp"] = function()
        local name = vim.fn.input("Name: ")
        local path = paths["cpp"]

        if path == "" then
            path = vim.fn.input("Path: ")
        end

        vim.cmd(":silent !cd ".. path .. " && " .. "git clone https://github.com/KDesp73/CPP-Project-Template " .. name)

        if options.cd then
            vim.cmd("cd " .. path .. name)

            if package.loaded['nvim-tree'] then
                require("nvim-tree")
            end
        end
    end,

    ["java"] = function()
        local groupId = vim.fn.input("Group Id: ")
        local artifactId = vim.fn.input("Artifact Id: ")
        local path = paths["java"]

        if path == "" then
            path = vim.fn.input("Path: ")
        end

        local command = "mvn archetype:generate -DgroupId=" .. groupId .. " -DartifactId=" .. artifactId .. " -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false"

        vim.cmd(":silent !cd " .. path .. " && " .. command)

        if options.cd then
            vim.cmd("cd " .. path .. artifactId)
        end
    end,

    ["swing"] = function ()
        local name = vim.fn.input("Name: ")
        local path = paths["java"]

        if path == "" then
            path = vim.fn.input("Path: ")
        end
        
        vim.cmd(":silent !cd ".. path .. " && " .. "git clone https://github.com/KDesp73/swing-gui-starter " .. name)

        if options.cd then
            vim.cmd("cd " .. path .. name)
        end
    end,


    ["nvim_plugin"] = function ()
        local name = vim.fn.input("Name: ")
        local path = paths["nvim_plugin"]

        if path == "" then
            path = vim.fn.input("Path: ")
        end
        
        vim.cmd(":silent !cd " .. path .. " && " .. "git clone https://github.com/KDesp73/plugin-template.nvim " .. name)

        if options.cd then
            vim.cmd("cd " .. path .. name)
        end
    end
}
