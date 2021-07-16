local quicklist = {}

quicklist.create_from_buffer = function()
    vim.cmd("cgetbuffer")
    vim.cmd("copen")
end

quicklist.estream_from_buffer = function()
    vim.cmd("silent normal yae")
    vim.cmd("new")
    vim.cmd("silent normal P")
    vim.bo.filetype = "estream"
    vim.cmd("silent 1,$!~/.local/share/nvim/site/pack/packer/start/estream/bin/estream")
    vim.cmd("cgetbuffer")
    vim.cmd("quit!")
    vim.cmd("copen")
end

return quicklist
