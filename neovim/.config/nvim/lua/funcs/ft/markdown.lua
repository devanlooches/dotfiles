local markdown = {}

markdown.currentfile = ""
markdown.currentpos = {}
markdown.tempfile = ""

markdown.handle_insert_image = function(id, data, event)
    vim.cmd("edit "..markdown.currentfile)
    vim.fn.setpos('.', markdown.currentpos)
    local lines = vim.fn.readfile(markdown.tempfile)
    for _, image in ipairs(lines) do
        vim.cmd("normal! o![]("..image..')')
        vim.cmd(vim.api.nvim_replace_termcodes("normal! <esc>", true, true, true))
    end
end

markdown.insert_image = function()
    markdown.currentfile = vim.fn.expand('%')
    markdown.currentpos = vim.fn.getcurpos()
    markdown.tempfile = vim.fn.tempname()
    local cmd = "vifm "..vim.fn.expand('%:h').." --choose-file="..markdown.tempfile
    vim.fn.termopen(cmd, {on_exit = markdown.handle_insert_image})
end

return markdown
