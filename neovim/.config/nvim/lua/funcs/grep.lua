local grep = {}
_G.grep = grep

grep.operator = function(type)
    local saved_unnamed_register = vim.fn.getreg('@')

    if (type == 'v') then
        vim.cmd('normal! `<v`>y')
    elseif (type == 'char') then
        vim.cmd('normal! `[y`]')
    else
        return
    end

    vim.cmd("grep! "..vim.fn.shellescape(vim.fn.getreg('@')).." .")
    vim.cmd('copen')

    vim.fn.setreg('@', saved_unnamed_register)
end

return grep
