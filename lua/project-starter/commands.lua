local vim = vim

return {
    cpp = function(path, name)
        vim.cmd(":silent !cd ".. path .. " && " .. "git clone https://github.com/KDesp73/CPP-Project-Template " .. name)
    end,

    java = function(path, groupId, artifactId)
        local command = "mvn archetype:generate -DgroupId=" .. groupId .. " -DartifactId=" .. artifactId .. " -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false"

        vim.cmd(":silent !cd " .. path .. " && " .. command)
    end,

    swing  = function(path, name)
        vim.cmd(":silent !cd ".. path .. " && " .. "git clone https://github.com/KDesp73/swing-gui-starter " .. name)
    end,

    nvim_plugin = function (path, name)
        vim.cmd(":silent !cd " .. path .. " && " .. "git clone https://github.com/KDesp73/plugin-template.nvim " .. name)
    end,

    python = function (path, name)
        vim.cmd(":silent !cd " .. path .. " && " .. "git clone https://github.com/KDesp73/python-starter.git " .. name)
    end,

    ruby = function (path, name)
        vim.cmd(":silent !cd " .. path .. " && " .. "bundle gem " .. name)
    end
}
