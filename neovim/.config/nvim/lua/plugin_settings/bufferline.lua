require'bufferline'.setup{
    options = {
    separator_style = "slant",
    always_show_bufferline = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. " " .. count
    end,
    enforce_regular_tabs = false ,
    view = "default",
    mappings = true,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    show_buffer_close_icons = false,
    show_close_icon = false,
    sort_by = 'extension',
    numbers = "none",
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    show_tab_indicators = true,
    highlights = {
            fill = {
                guifg = {
                attribute = "fg",
                highlight = "Pmenu"
            }}},
}}
local opts = {silent=true, noremap=true}
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-<>', ':BufferLineMovePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<C->>', ':BufferLineMoveNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>c', ':bdelete<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>p', ':BufferLinePick<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferLineSortByExtension<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferLineSortByDirectory<CR>', opts)

local wk = require('whichkey_setup')
local which_key_map = {}
-- tabs
which_key_map.t = {
    name = '+tabs',
    c = {':bd<CR>', 'Close current tab'},
    p = {':BufferLinePick<CR>', 'Pick buffer'},
    d = {':BufferLineSortByExtension<CR>', 'Order By Directory'},
    l = {':BufferLineSortByDirectory<CR>', 'Order By Language'},
    [','] = {':BufferLineCyclePrev<CR>', 'Previous tab'},
    ['.'] = {':BufferLineCycleNext<CR>', 'Next tab'},
    ['>'] = {':BufferLineMoveNext<CR>', 'Move tab left'},
    ['<'] = {':BufferLineCyclePrev<CR>', 'Move tab right'},
}

wk.register_keymap('leader', which_key_map)
