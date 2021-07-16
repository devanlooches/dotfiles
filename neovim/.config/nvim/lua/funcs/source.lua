local source = {}

source.config = function()
    vim.cmd("luafile ~/.config/nvim/init.lua")
end

return source
