return function()
    vim.bo.textwidth = 80
    vim.cmd('abbreviate <buffer> // /Axel Dahlberg')
end
