return function()
    vim.bo.errorformat = ''..
        [[%f|%l|%c,]]..
        [[%f|%l|,]]..
        [[%f||,]]..
        [[%-G%.%#]]
end
