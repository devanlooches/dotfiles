local M = {}

M.init = function()
    local filetype = vim.bo.filetype
    if string.len(filetype) == 0 then
        return
    end
    filetype = vim.fn.substitute(filetype, '-term$', '', '') -- use same for terminal of filetype
    local status, init = pcall(require, "ftplugin."..filetype)
    if (status) then
        init()
    end
end

return M
