local fileselect = {}

fileselect.currentfile = ""
fileselect.currentpos = {}
fileselect.tempfile = ""

fileselect.handle_select = function(id, data, event)
    vim.cmd("edit "..fileselect.currentfile)
    vim.fn.setpos('.', fileselect.currentpos)
    local lines = vim.fn.readfile(fileselect.tempfile)
    vim.fn.setreg('"', vim.fn.join(lines, [[\n]]))
end

-- selects a file using vifm a places it in register ""
fileselect.select = function()
    fileselect.currentfile = vim.fn.expand('%')
    fileselect.currentpos = vim.fn.getcurpos()
    fileselect.tempfile = vim.fn.tempname()
    local cmd = "vifm "..vim.fn.expand('%:h').." --choose-file="..fileselect.tempfile
    vim.fn.termopen(cmd, {on_exit = fileselect.handle_select})
end

return fileselect
