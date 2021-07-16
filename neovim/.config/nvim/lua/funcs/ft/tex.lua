local tex = {}

tex.open = function()
    vim.cmd("!xdg-open %:r.pdf &")
end

tex.clean = function()
    vim.cmd(":!rm -f %:r.aux %:r.end %:r.log %:r.out %:r.pyg")
end

tex.bib_compile = function()
    vim.cmd('wa')
    require('funcs.terminal').dedicated("latex", "pdflatexfull %", "tabnew")
end

-- TODO check this
tex.install_packages = function()
    vim.api.nvim_exec([[
    let winview = winsaveview()
    call inputsave()
    let cmd = ['tllocalmgr install']
    %call add(cmd, matchstr(getline('.'), '\\usepackage\(\[.*\]\)\?{\zs.*\ze\}'))
    echomsg join(cmd)
    let pass = inputsecret('Enter sudo password:') . "\n"
    echo system(join(cmd), pass)
    " echo system(join(cmd))
    call inputrestore()
    call winrestview(winview)
    ]], false)
end

return tex
