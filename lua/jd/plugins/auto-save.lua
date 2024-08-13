return {
    "pocco81/auto-save.nvim",
    config = function ()
        require('auto-save').setup(
            {
                trigger_events = {"InsertLeave", "TextChanged"},
                condition = function(buf)
                    local fn = vim.fn
                    local utils = require("auto-save.utils.data")

                    if
                        fn.getbufvar(buf, "&modifiable") == 1 and
                        utils.not_in(fn.getbufvar(buf, "&filetype"), {"harpoon"}) then
                        return true
                    end
                    return false
                end,
            }
        )
    end
}
