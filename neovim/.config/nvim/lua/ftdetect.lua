local au = require("funcs.autocmds")

local function ftdetect(ftypes)
    local autocmds = {}
    for ftype, pattern in pairs(ftypes) do
        autocmds[pattern] = {'set ft='..ftype}
    end
    au.define_autocmds({['BufNewFile,BufRead'] = autocmds})
end

ftdetect({
    vim = {'vifmrc', '*.vifm'},
    dot = {'*.dot'},
    sage = {'*.sage'},
    arduino = {'*.ino'},
})
