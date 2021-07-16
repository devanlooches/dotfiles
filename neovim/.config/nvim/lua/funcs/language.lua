M = {}

local function inoremap(keymap)
    local opts = {noremap = true}
    for lhs, rhs in pairs(keymap) do
        vim.api.nvim_buf_set_keymap(0, 'i', lhs, rhs, opts)
    end
end

local function iunmap(keymap)
    for lhs, _ in pairs(keymap) do
        vim.api.nvim_buf_del_keymap(0, 'i', lhs)
    end
end

local french_keymap = {
    [';'] =  '<C-k>o:',
    ['\''] = '<C-k>a:',
    ['['] =  '<C-k>aa',
    ['<A-;>'] =  ';',
    ['<A-\'>'] = '\'',
    ['<A-[>'] =  '[',
}

local language

M.enable_french = function()
    language = "fr_FR"
    vim.o.spelllang = "fr_FR"
    inoremap(french_keymap)
end

M.disable_french = function()
    language = "en"
    vim.o.spelllang = "en"
    iunmap(french_keymap)
end

M.toggle_french = function()
    if language == "fr_FR" then
        M.disable_french()
    else
        M.enable_french()
    end
end
-- fr_FR.UTF-8
-- en_US
-- ru_RU
return M
