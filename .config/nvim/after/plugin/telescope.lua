local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files{hidden=true, 
    find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob=!**/.git/*",
        -- "--glob=!**/.config/nvim/*",
        "--with-filename", -- Print the file path with the matched lines
        "--line-number",   -- Show line numbers
        "--column",       -- "--glob=!**/.idea/*",
        -- "--glob=!**/.vscode/*",
        -- "--glob=!**/build/*",
        -- "--glob=!**/dist/*",
        -- "--glob=!**/yarn.lock",
        -- "--glob=!**/package-lock.json",
      }} end, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>fa', builtin.live_grep, { desc = 'Telescope search through files' })
