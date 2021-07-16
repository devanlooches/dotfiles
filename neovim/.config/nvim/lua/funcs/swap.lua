local swap = {}

swap.diff = function()
    vim.cmd('recover')
    vim.cmd("write "..vim.fn.expand('%')..".recovered")
    vim.cmd("vert diffsplit "..vim.fn.expand('%')..".recovered")
end

swap.clear = function()
    vim.cmd("!rm -f "..vim.fn.fnameescape(vim.fn.substitute(vim.fn.substitute(vim.fn.swapname('%'), '//', '/', 'g'), 'swo', 'swp', '')))
    vim.cmd("!rm -f "..vim.fn.expand('%')..".recovered")
end

return swap
