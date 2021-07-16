local terminal = {}

local last_command = {}

local function get_command(command, base_filetype)
    local filetype = vim.bo.filetype
    if vim.fn.match(filetype, '-term$') ~= -1 then
        if last_command[base_filetype] == nil then
            vim.cmd('echoerr "Something went wrong, didn\'t have a last command for base filetype: '..base_filetype..'"')
        end
        return last_command[base_filetype]
    end
    local expanded_command = vim.fn.expandcmd(command)
    last_command[filetype] = expanded_command
    return expanded_command
end

-- Function for running dedicated terminal (thanks Sam MS:))
terminal.dedicated = function(termname, command, precmd)
    local base_filetype = vim.fn.substitute(vim.bo.filetype, '-term$', '', '')
    local buf = vim.fn.bufexists(termname)
    local expanded_command = get_command(command, base_filetype)
    -- If buffer exists, delete it first
    if (buf > 0) then
        vim.cmd('bdelete! '..termname)
    end
    -- Create new buffer and run command
    vim.cmd(precmd)
    vim.cmd('terminal '..expanded_command)
    vim.cmd('normal G')
    vim.cmd('file '..termname)
    vim.bo.filetype = base_filetype..'-term'
end

return terminal
