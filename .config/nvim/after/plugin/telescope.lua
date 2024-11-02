local builtin = require('telescope.builtin')
local telescope = require("telescope")


telescope.setup({
    pickers = {
        find_files = {
            hidden = true,
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob=!**/.git/*",
                "--glob=!**/__pycache__/*",
                "--glob=!**/py_env/*",
                "--glob=!**/.asdf/*",
                -- "--glob=!**/.config/nvim/*",
                "--with-filename", -- Print the file path with the matched lines
                "--line-number",   -- Show line numbers
                "--column",       -- "--glob=!**/.idea/*",
                -- "--glob=!**/.vscode/*",
                -- "--glob=!**/build/*",
                -- "--glob=!**/dist/*",
                -- "--glob=!**/yarn.lock",
                -- "--glob=!**/package-lock.json",
            },
            no_ignore = true
        },
        live_grep = {
            additional_args = function(opts)
               return {"--hidden", "--glob=!**/.git/*"}
            end
        }
    }
})

vim.keymap.set('n', '<leader>ff', function() builtin.find_files() end, { desc = 'Telescope find files'})

vim.keymap.set('n', '<leader>fa', function() builtin.live_grep() end, { desc = 'Telescope search through files' })
