return function()
    require('funcs.dedterm').setup{
        run_cmd = "cargo run",
        test_cmd = "cargo test",
    }

    vim.bo.errorformat = ''..
        [[%-Gerror: aborting %.%#,]]..
        [[%-Gerror: Could not compile %.%#,]]..
        [[%Eerror: %m,]]..
        [[%Eerror[E%n]: %m,]]..
        [[%Wwarning: %m,]]..
        [[%Inote: %m,]]..
        [[%C %#--> %f:%l:%c,]]..
        [[%E  left:%m,%C right:%m %f:%l:%c,%Z,]]..
        [[%-G%.%#]]
end
