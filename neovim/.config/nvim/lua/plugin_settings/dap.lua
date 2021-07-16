local dap = require('dap')
local wk = require('whichkey_setup')

dap.adapters.python = {
    type = 'executable',
    command = 'python',
    args = {'-m', 'debugpy.adapter'},
}
dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function() return '/usr/bin/python' end,
    },
}

local keymap = {
    name = '+debug',
    c = {'<Cmd>lua require"dap".continue()<CR>', 'continue'},
    n = {'<Cmd>lua require"dap".step_over()<CR>', 'step over'},
    s = {'<Cmd>lua require"dap".step_into()<CR>', 'step into'},
    S = {'<Cmd>lua require"dap".step_out()<CR>', 'step out'},
    b = {'<Cmd>lua require"dap".toggle_breakpoint()<CR>', 'toggle br'},
    B = {'<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', 'set br condition'},
    p = {'<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', 'set log br'},
    r = {'<Cmd>lua require"dap".repl.open()<CR>', 'REPL open'},
    l = {'<Cmd>lua require"dap".run_last()<CR>', 'run last'},
}
wk.register_keymap('leader', {d = keymap})
