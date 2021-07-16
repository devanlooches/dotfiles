local wk = require('whichkey_setup')

local keymap = {
    name = '+git',
    d = {':Gdiffsplit!<CR>', 'diff fix'},
    h = {':diffget //2<CR>', 'diff get left'},
    l = {':diffget //3<CR>', 'diff get right'},
    g = {':GBrowse<CR>', 'browse'},
    c = {':Gclog!<CR>', 'git log qf'},
}

wk.register_keymap('leader', {g = keymap})
