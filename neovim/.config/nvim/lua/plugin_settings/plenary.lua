local wk = require("whichkey_setup")
local keymap = {p = {
    name = "+plugin",
    t = {"<Plug>PlenaryTestFile", "test file"},
}}
wk.register_keymap('leader', keymap)
