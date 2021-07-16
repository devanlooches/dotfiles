local python = {}

-- NOTE Below functions taken from https://github.com/alfredodeza/pytest.vim
-- Always goes back to the first instance
-- and returns that if found
local find_python_object = function(obj)
    local orig_line          = vim.fn.line('.')
    local orig_indent        = vim.fn.indent(orig_line)
    local objregexp          = nil
    local max_indent_allowed = nil


    if (obj == "class") then
        objregexp  = [[\v^\s*(.*class)\s+(\w+)\s*]]
        max_indent_allowed = 0
    elseif (obj == "method") then
        objregexp = [[\v^\s*(.*def)\s+(\w+)\s*\(\_s*(self[^)]*)]]
        max_indent_allowed = 4
    elseif (obj == "function") then
        objregexp = [[\v^\s*(.*def)\s+(\w+)\s*\(\_s*(.*self)@!]]
        max_indent_allowed = orig_indent
    else
        vim.cmd('echoerr "Unknown object: "'..obj)
        return false
    end

    local flag = "Wb"

    while (vim.fn.search(objregexp, flag) > 0) do
        --
        -- Very naive, but if the indent is less than or equal to four
        -- keep on going because we assume you are nesting.
        -- Do not count lines that are comments though.
        --
        local indent = vim.fn.indent(vim.fn.line('.'))
        if (indent <= 4) and (vim.api.nvim_eval([[getline(line('.')) =~ '\v^\s*#(.*)']]) == 0) then
          if (indent <= max_indent_allowed) then
            return true
        end
      end
    end
    return false
end

local replace_termcodes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local name_of_current_function = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd(replace_termcodes("normal! $<cr>"))
    local find_object = find_python_object('function')
    local object = nil
    if (find_object) then
        local line = vim.fn.getline('.')
        local match_result = vim.fn.matchlist(line, [[ *def \+\(\w\+\)]])
        object = match_result[2]
    end
    vim.fn.setpos('.', save_cursor)
    return object
end

local name_of_current_class = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd(replace_termcodes('normal! $<cr>'))
    local find_object = find_python_object('class')
    local object = nil
    if (find_object) then
        local line = vim.fn.getline('.')
        local match_result = vim.fn.matchlist(line, [[ *class \+\(\w\+\)]])
        object = match_result[2]
    end
    vim.fn.setpos('.', save_cursor)
    return object
end


local name_of_current_method = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd(replace_termcodes('normal! $<cr>'))
    local find_object = find_python_object('method')
    local object = nil
    if (find_object) then
        local line = vim.fn.getline('.')
        local match_result = vim.fn.matchlist(line, [[ *def \+\(\w\+\)]])
        object = match_result[2]
    end
    vim.fn.setpos('.', save_cursor)
    return object
end

python.test_function = function(precmd)
    vim.cmd("normal! wa")
    local save_cursor = vim.fn.getcurpos()
    local current_function = name_of_current_function()
    vim.fn.setpos('.', save_cursor)
    if (current_function == nil) then
        vim.cmd('echoerr "Unable to find a matching function for testing"')
        return
    end
    local cmd = "pytest -x "..vim.fn.expand('%').."::"..current_function
    require('funcs.terminal').dedicated("pytest", cmd, precmd)
end

python.test_cwd = function(precmd)
    vim.cmd("normal! wa")
    local cmd = "pytest -x "..vim.fn.getcwd()
    require('funcs.terminal').dedicated("pytest", cmd, precmd)
end


return python
