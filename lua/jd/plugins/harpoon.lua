return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })
    end,
    keys = function ()
        local harpoon = require("harpoon"):setup()
        return {
            { "<leader>hA", function() harpoon:list():add() end, desc = "harpoon file", },
            { "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
            { "<leader>h<leader>", function() harpoon.ui:nav_next() end, desc = "navigate to next mark", },
            { "<leader>hp", function() harpoon.ui:nav_prev() end, desc = "navigate to previous mark", },

            { "<leader>hA", function() harpoon:list():add() end, desc = "harpoon file", },
            { "<leader>ha", function() harpoon:list():select(1) end, desc = "harpoon to file 1", },
            { "<leader>hs", function() harpoon:list():select(2) end, desc = "harpoon to file 2", },
            { "<leader>hd", function() harpoon:list():select(3) end, desc = "harpoon to file 3", },
            { "<leader>hf", function() harpoon:list():select(4) end, desc = "harpoon to file 4", },
        }
    end,
}
