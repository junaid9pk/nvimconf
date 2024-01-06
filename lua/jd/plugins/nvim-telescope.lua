return {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.1',
    branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
        local function exists(file)
            local ok, err, code = os.rename(file, file)
            if not ok then
                if code == 13 then
                    -- Permission denied, but it exists
                    return true
                end
            end
            return ok, err
        end

        local function isdir(path)
            -- "/" works on both Unix and Windows
            return exists(path.."/")
        end

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        if (isdir(".git")) then
            vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
        else
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        end
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
    end
}

