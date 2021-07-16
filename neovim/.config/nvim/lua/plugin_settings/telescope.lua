local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case'
        },
        selection_strategy = "reset",
        file_ignore_patterns = {},
        path_display = true,
        prompt_prefix = " ",
        selection_caret = " ",
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-H>"] = actions.move_to_top,
                ["<C-M>"] = actions.move_to_middle,
                ["<C-L>"] = actions.move_to_bottom,


                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
            },
            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["<C-j>"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["<C-k>"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            }
        }
    }
}
local wk = require('whichkey_setup')

local opts = {silent=true, noremap=true}
vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>', opts)

local keymap = {
    name = '+find',
    l = {'<Cmd>Telescope live_grep<CR>', 'live grep'},
    b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
    h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
    c = {
        name = '+commands',
        c = {'<Cmd>Telescope commands<CR>', 'commands'},
        h = {'<Cmd>Telescope command_history<CR>', 'history'},
    },
    q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
    g = {
        name = '+git',
        g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
        c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
        b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
        s = {'<Cmd>Telescope git_status<CR>', 'status'},
    },
}

wk.register_keymap('leader', {f = keymap})
