local browse = {}

browse.browse = function(url)
    print(url)
    os.execute('qutebrowser '..url)
end

return browse
