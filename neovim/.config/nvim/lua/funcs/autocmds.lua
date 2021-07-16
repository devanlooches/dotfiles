local M = {}

-- TODO update when api supports
M.define_autocmds = function(autocmds)
    for event, event_cmds in pairs(autocmds) do
        for pattern, pattern_cmds in pairs(event_cmds) do
            if pattern_cmds.reset then
                vim.cmd('autocmd! '..event..' '..pattern)
                pattern_cmds.reset = nil
            end
            for _, cmd in ipairs(pattern_cmds) do
                vim.cmd('autocmd '..event..' '..pattern..' '..cmd)
            end
        end
    end
end

return M
