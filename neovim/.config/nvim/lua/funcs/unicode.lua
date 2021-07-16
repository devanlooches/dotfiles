local unicode = {}

unicode.replace_hex_to_char = function()
    vim.cmd("normal diw")
    local hex = vim.fn.getreg('"')
    vim.cmd("normal i"..vim.fn.nr2char(hex))
    vim.cmd(vim.api.nvim_replace_termcodes("normal! <esc>", true, true, true))
end

unicode.replace_char_to_hex = function()
    vim.cmd("normal vd")
    local hex = vim.fn.getreg('"')
    vim.cmd("normal i0x"..vim.fn.printf('%x', vim.fn.char2nr(hex)))
    vim.cmd(vim.api.nvim_replace_termcodes("normal! <esc>", true, true, true))
end

return unicode
