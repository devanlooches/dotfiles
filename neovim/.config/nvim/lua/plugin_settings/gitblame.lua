vim.g.gitblame_enabled = 0
vim.g.gitblame_highlight_group = "GruvboxGray"

local wk = require('whichkey_setup')
local keymap = {
    name = '+git',
    b = {':GitBlameToggle<CR>', 'blame'},
}
wk.register_keymap('leader', {g = keymap})
