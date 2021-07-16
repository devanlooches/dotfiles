local highlight = {}

highlight.bright_comments = true

highlight.discrete_comments = function()
    vim.cmd("highlight! link Comment GruvboxGray")
end

highlight.bright_comments = function()
    vim.cmd("highlight! link Comment GruvboxOrangeBold")
end

highlight.toggle_bright_comments = function()
    highlight.bright_comments = not highlight.bright_comments
    if highlight.bright_comments then
        highlight.bright_comments()
    else
        highlight.discrete_comments()
    end
end

return highlight
