local vim = vim

local M = {}

function default(lang, path, name)
    local command = ":silent !cd " .. path .. " && git clone --depth=1 https://github.com/KDesp73/" .. lang .. "-starter " .. name

    vim.cmd(command)
    vim.cmd(":silent !cd " .. path .. name .. " && rm -r .git")
end

M.php = function (path, name)
    default("php", path, name)
end

M.asm = function (path, name)
    default("asm", path, name)
end

M.go = function (path, name)
    local command = ":silent !cd " .. path .. " && wget -qL https://raw.githubusercontent.com/KDesp73/project-starter.nvim/main/scripts/generate-tree.go && go run generate-tree.go " .. name .. " && rm generate-tree.go"
    vim.cmd(command)
end

M.esp32 = function (path, name)
    vim.cmd(":silent !cd " .. path .. " && " .. "git clone --depth=1 https://github.com/KDesp73/esp32-starter " .. name)
    vim.cmd(":silent !cd " .. path .. name .. " && rm -r .git")
end

M.android = function(path, name, package_name)
    -- Python3 is required
    vim.cmd(":silent !cd " .. path .. " && " .. "python3 -c \"$(curl -fsSL https://raw.githubusercontent.com/KDesp73/kotlin-compose-starter/master/create-android-kotlin-app.py)\" " .. name .. " " .. package_name)
end

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
