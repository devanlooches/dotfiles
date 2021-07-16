local M = {}
local wk = require("whichkey_setup")

local get_dedterm_cmd = function(cmd, precmd)
    local termname = vim.fn.substitute(vim.bo.filetype, '-term$', '', '')
    return '<Cmd>lua require("funcs.terminal").dedicated("'..termname..'", "'..cmd..'", "'..precmd..'")<CR>'
end

M.setup = function(settings)
    if settings == nil then
        settings = {}
    end
    local run_cmd = settings.run_cmd
    settings.run_cmd = nil
    local test_cmd = settings.test_cmd
    settings.test_cmd = nil
    settings.bufnr = 0 -- TODO always 0?
    local keymap = {}
    if (run_cmd ~= nil) then
        keymap.r = {get_dedterm_cmd(run_cmd, "tabnew"), 'run tab'}
        keymap.R = {get_dedterm_cmd(run_cmd, "split"), 'run split'}
    end
    if (test_cmd ~= nil) then
        keymap.t = {get_dedterm_cmd(test_cmd, "tabnew"), 'test tab'}
        keymap.T = {get_dedterm_cmd(test_cmd, "split"), 'test split'}
    end
    wk.register_keymap('localleader', keymap, settings)
end

return M
