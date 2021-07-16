require"gitlinker".setup({
   mappings = "<Leader>gy" -- mapping to call url generation
})

local wk = require("whichkey_setup")
local keymaps = { g = {
    name = '+git',
    y = 'get link',
}}
wk.register_keymap('leader', keymaps)
