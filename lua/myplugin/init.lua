local M = {}

M.setup = function (opts)
    print(opts)
end

print("This will print only on the 1st require(\"myplugin\")")

return M
