local wk = require("whichkey_setup")

return function()
    require('funcs.dedterm').setup{
        run_cmd = "python -i %",
        test_cmd = "pytest -x %",
    }

    local keymap = {
        f = {':lua require("funcs.ft.python").test_function("tabnew")<CR>', 'test function'},
        p = {':lua require("funcs.ft.python").test_cwd("tabnew")<CR>', 'test cwd'},
        F = {':lua require("funcs.ft.python").test_function("split")<CR>', 'test function split'},
        P = {':lua require("funcs.ft.python").test_cwd("split")<CR>', 'test cwd split'},
    }

    local opts = {silent = true, noremap = true, bufnr = 0}
    wk.register_keymap('localleader', keymap, opts)
    vim.bo.makeprg = [[python\ %]]
    vim.bo.errorformat = ''..
        [[%*\sFile "%f"\, line %l\, %m,]]..
        [[%*\sFile "%f"\, line %l,]]..
        [[%f:%l: %m,]]..
        [[%f:%l:,]]..
        [[%-G%.%#]]
end
