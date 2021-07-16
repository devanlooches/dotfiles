vim.cmd('highlight link GitSignsAdd Title')
vim.cmd('highlight link GitSignsDelete WarningMsg')
vim.cmd('highlight link GitSignsChange ModeMsg')

require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '契', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '契', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
        ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

        -- Text objects
        ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
    },
}

local wk = require('whichkey_setup')
local keymap = {
    name = '+hunk',
    s = {'<Cmd>lua require("gitsigns").stage_hunk()<CR>', 'stage'},
    u = {'<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>', 'unstage'},
    r = {'<Cmd>lua require("gitsigns").reset_hunk()<CR>', 'reset'},
    R = {'<Cmd>lua require("gitsigns").reset_buffer()<CR>', 'reset buffer'},
    p = {'<Cmd>lua require("gitsigns").preview_hunk()<CR>', 'preview'},
    b = {'<Cmd>lua require("gitsigns").blame_line()<CR>', 'blame'},
}
wk.register_keymap('leader', {h = keymap})
