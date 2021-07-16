local profiling = {}

profiling.start = function (prof_file)
    vim.cmd("profile start "..prof_file)
    vim.cmd("profile func *")
    vim.cmd("profile file *")
end

profiling.stop = function()
    vim.cmd("profile paus")
    vim.cmd("noautocmd qall")
end

return profiling
