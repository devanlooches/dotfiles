-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

local function set_keymap(mode, opts, keymaps)
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    end
end

-- normal
set_keymap('n', {noremap=true, silent=true}, {
    -- remap leader keys to noop
    {' ', ''},
    {'\\', ''},

    -- execute q macro
    {'m', '@q'},

    -- source config
    {'<C-s>', ':lua require("funcs.source").config()<CR>'},

    -- Smart way to move between windows
    {'<C-h>', '<C-w>h'},
    {'<C-j>', '<C-w>j'},
    {'<C-k>', '<C-w>k'},
    {'<C-l>', '<C-w>l'},

    -- Page down/up
    {'[d', '<PageUp>'},
    {']d', '<PageDown>'},

    -- Resize split
    {'<Up>', ':resize +2<CR>'},
    {'<Down>', ':resize -2<CR>'},
    {'<Left>', ':vertical resize +2<CR>'},
    {'<Right>', ':vertical resize -2<CR>'},

})
-- visual
set_keymap('x', {noremap=true, silent=true}, {
    -- Allow pasting same thing many times
    {'p', '""p:let @"=@0<CR>'},

    -- better indent
    {'<', '<gv'},
    {'>', '>gv'},

    -- Visual mode pressing * or # searches for the current selection
    {'*', ':<C-u>lua require("funcs.search").visual_selection("/")<CR>/<C-r>=@/<CR><CR>'},
    {'#', ':<C-u>lua require("funcs.search").visual_selection("?")<CR>?<C-r>=@/<CR><CR>'},

    -- move selected line(s)
    {'K', ':move \'<-2<CR>gv-gv'},
    {'J', ':move \'>+1<CR>gv-gv'},
})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- insert
set_keymap('i', {noremap=true, silent=true}, {
    -- Smart way to move between tabs
    {'<A-h>', [[<C-\><C-n>gT]]},
    {'<A-l>', [[<C-\><C-n>gt]]},

    -- alternative esc
    {'jk', '<Esc>'},

    -- insert special carachters
    {'<C-b>', '<C-k>'},

    -- navigate display lines
    {'<Down>', '<Esc>gja'},
    {'<Up>', '<Esc>gka'},
})

-- terminal
set_keymap('t', {noremap=true, silent=true}, {
    -- quickfix from buffer
    {'<C-q>', [[<C-\><C-n>:lua require("funcs.quicklist").create_from_buffer()<CR>]]},

    -- escape in terminal
    {'<Esc>', [[<C-\><C-n>]]},
    {'<A-[>', '<Esc>'},

    -- Smart way to move between windows
    {'<C-h>', [[<C-\><C-N><C-w>h]]},
    {'<C-j>', [[<C-\><C-N><C-w>j]]},
    {'<C-k>', [[<C-\><C-N><C-w>k]]},
    {'<C-l>', [[<C-\><C-N><C-w>l]]},

    -- Smart way to move between tabs
    {'<A-h>', [[<C-\><C-N>gT]]},
    {'<A-l>', [[<C-\><C-N>gt]]},
})

-- leader
local wk = require("whichkey_setup")

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- normal
local which_key_map = {}
-- general
which_key_map['w'] = {'<Cmd>w<CR>', 'save file'}
which_key_map['W'] = {'<Cmd>wa<CR>', 'save all'}
which_key_map['Q'] = {'<Cmd>wqa<CR>', 'save quit all'}
which_key_map['S'] = {'<Cmd>wa<CR><Cmd>mksession!<CR><Cmd>qa<CR>', 'save session quit all'}
which_key_map['<CR>'] = {'<Cmd>noh<CR><Plug>SearchantStop<CR>', 'no search hl'}
which_key_map['*'] = {'*<Cmd>lua require("funcs.search").vim("*."..vim.fn.expand("%:e"))<CR>', 'vimgrep cursor'}

-- quickfix
which_key_map.q = {
    name = '+quickfix',
    q = {':lua require("funcs.quicklist").create_from_buffer()<CR>', 'from buffer'},
    e = {':lua require("funcs.quicklist").estream_from_buffer()<CR>', 'from buffer'},
    G = {':clast<CR>', 'last'},
    g = {':cfirst<CR>', 'first'},
    c = {':cclose<CR>', 'close'},
    o = {':copen<CR>', 'open'},
}

-- make
which_key_map.m = {
    name = '+make',
    m = {':lua require("funcs.terminal").dedicated("make", "make", "tabnew")<CR>', 'make'},
    c = {':lua require("funcs.terminal").dedicated("make", "make clean", "tabnew")<CR>', 'clean'},
    a = {':lua require("funcs.terminal").dedicated("make", "make all", "tabnew")<CR>', 'all'},
    o = {':lua require("funcs.terminal").dedicated("make", "make open", "tabnew")<CR>', 'open'},
}

-- search
which_key_map.s = {
    name = '+search',
    f = {':lua require("funcs.search").vim("*."..vim.fn.expand("%:e"))<CR>', 'search project'},
    a = {':lua require("funcs.search").vim("*")<CR>', 'seach project all'},
    s = {':set operatorfunc=v:lua.grep.operator<CR>g@', 'grep operator'},
}

-- cwd
which_key_map.c = {
    name = '+cwd',
    d = {':cd %:p:h<CR>:pwd<CR>', 'cd to current'},
    l = {':lcd %:p:h<CR>:pwd<CR>', 'lcd to current'},
}

-- navigation
which_key_map.n = {
    name = '+navigation',
    s = {'<Cmd>VifmSelectFile<CR>', 'vifm select'},
}

-- lsp and syntax
which_key_map.l = {
    name = '+lsp',
    c = {'<Cmd>lua require("funcs.highlight").toggle_bright_comments()<CR>', 'toggle bright comments'},
}

-- unicode
which_key_map.u = {
    name = '+unicode',
    t = {'<Cmd>lua require("funcs.unicode").replace_hex_to_char()<CR>', 'hx2ch'},
    f = {'<Cmd>lua require("funcs.unicode").replace_char_to_hex()<CR>', 'ch2hx'},
}

-- input/language
which_key_map.i = {
    name = '+input/language',
    s = {'<Cmd>lua require("funcs.language").toggle_sfrench()<CR>', 'toggle fr'},
}

wk.register_keymap('leader', which_key_map)

-- visual
local which_key_visual_map = {}
-- search
which_key_visual_map.s = {
    name = '+search',
    s = {':call v:lua.grep.operator(visualmode())<CR>', 'grep visual'},
}

wk.register_keymap('visual', which_key_visual_map)
