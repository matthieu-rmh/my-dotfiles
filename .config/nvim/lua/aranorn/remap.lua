vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", "<C-_>", ":norm gcc<CR>")
vim.keymap.set("n", "<A-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<A-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<A-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<A-l>", ":TmuxNavigateRight<CR>")
vim.api.nvim_set_keymap('i', '<C-h>', '<BS>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set("v", "<C-_>", "gc", {remap = true})
vim.keymap.set('n', '<CR>', 'm`o<Esc>``')
vim.keymap.set('n', '<S-CR>', 'm`O<Esc>``')
vim.api.nvim_set_keymap('n', '<leader>or', ':!bash -ic "osr"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>otr', ':!bash -ic "o17r"<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
