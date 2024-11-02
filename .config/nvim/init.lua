require("aranorn")
vim.defer_fn(function()
    -- vim.cmd.colorscheme("cyberdream")
    vim.keymap.set({'n', 'v'}, '<C-j>', "3jzz", { silent = true })
    vim.keymap.set({'n', 'v'}, '<C-k>', "3kzz", { silent = true })
    vim.cmd.colorscheme("mellow")
    vim.api.nvim_set_option("clipboard", "unnamedplus")
    -- vim.g['airline_theme'] = 'base16_synth_midnight_dark'
end, 100)
