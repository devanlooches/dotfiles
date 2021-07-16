local wk = require("whichkey_setup")
local cm = require("funcs.commands")

return function()
    require('funcs.dedterm').setup{
        run_cmd = "pdflatex &",
    }
    local keymap = {
        o = {
            ':lua require("funcs.ft.tex").open()<CR><CR>',
            'open',
        },
        c = {
            ':lua require("funcs.ft.tex").clean()<CR><CR>',
            'clean',
        },
        R = {
            ':lua require("funcs.ft.tex").bib_compile()<CR>',
            'bib compile',
        },
    }

    local opts = {silent = true, noremap = true, bufnr = 0}
    wk.register_keymap('localleader', keymap, opts)

    cm.define_commands({
        LatexInstallPackages = {
            nargs = 0,
            cmd = "<Cmd>lua require('funcs.ft.tex').install_packages()",
            buffer = true,
        }
    })
end
