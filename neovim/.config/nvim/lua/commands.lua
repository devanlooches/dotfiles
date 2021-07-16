local cm = require("funcs.commands")

cm.define_commands({
    -- :W sudo saves the file
    -- (useful for handling the permission-denied error)
    W = {nargs = 0 , cmd = 'w !sudo tee % > /dev/null'},

    -- profiling
    StartProf = {nargs = 0 , cmd = 'lua require("funcs.profiling").start("vim-profile.log")'},
    EndProf = {nargs = 0 , cmd = 'lua require("funcs.profiling").stop()'},

    -- swap
    SwapDiff = {nargs = 0 , cmd = 'lua require("funcs.swap").diff()'},
    SwapClear = {nargs = 0 , cmd = 'lua require("funcs.swap").clear()'},

    -- select file using vifm
    VifmSelectFile = {nargs = 0 , cmd = 'lua require("funcs.fileselect").select()'},

    -- Browse
    Browse = {nargs = 1 , cmd = 'lua require("funcs.browse").browse(<args>)'},
})
