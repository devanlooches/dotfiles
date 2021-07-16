local cm = require("funcs.commands")

return function()
    cm.define_commands({
        InsertImage = {
            nargs = 0,
            cmd = ":lua require('funcs.ft.markdown').insert_image()",
            buffer = true,
        }
    })
end
