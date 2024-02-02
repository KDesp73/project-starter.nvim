local vim = vim

local M = {}

M.c = function(path, name)
    vim.cmd(":silent !cd ".. path .. " && " .. "git clone --depth=1 https://github.com/KDesp73/c-starter " .. name)
    vim.cmd(":silent !cd " .. path .. name .. " && rm -r .git")
end

M.cpp = function(path, name)
    vim.cmd(":silent !cd ".. path .. " && " .. "git clone --depth=1 https://github.com/KDesp73/CPP-Project-Template " .. name)
    vim.cmd(":silent !cd " .. path .. name .. " && rm -r .git")
end

M.java = function(path, groupId, artifactId)
    local command = "mvn archetype:generate -DgroupId=" .. groupId .. " -DartifactId=" .. artifactId .. " -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false"

    vim.cmd(":silent !cd " .. path .. " && " .. command)
end

M.swing  = function(path, name)
    vim.cmd(":silent !cd ".. path .. " && " .. "git clone --depth=1 https://github.com/KDesp73/swing-gui-starter " .. name)
    vim.cmd(":silent !cd " .. path .. name .. " && rm -r .git")
end

M.nvimplugin = function (path, name)
    vim.cmd(":silent !cd " .. path .. " && " .. "git clone --depth=1 https://github.com/KDesp73/plugin-template.nvim " .. name)
    vim.cmd(":silent !cd " .. path .. name .. " && rm -r .git")
end

M.python = function (path, name)
    vim.cmd(":silent !cd " .. path .. " && " .. "git clone --depth=1 https://github.com/KDesp73/python-starter.git " .. name)
    vim.cmd(":silent !cd " .. path .. name .. " && rm -r .git")
end

M.ruby = function (path, name)
    vim.cmd(":silent !cd " .. path .. " && " .. "bundle gem " .. name)
end

return M
