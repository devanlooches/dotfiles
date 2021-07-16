local au = require("funcs.autocmds")

au.define_autocmds({
    FileType = {
        ['*'] = {
            -- don't insert comments
            'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
            -- ftplugin
            'lua require("ftplugin").init()'
        },
    },
    TermOpen = {
        ['*'] = {
            -- automatically enter insert mode on new terminals
            'startinsert',
        },
    },
    BufReadPost = {
        ['*'] = {
            -- return to last edit position when opening files
            [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
        },
    },
})
