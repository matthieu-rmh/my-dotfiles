require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<C-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
  hide_numbers = true, -- hide the number column in toggleterm buffers
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = false, 
  --highlights = {
  --    -- highlights which map to a highlight group name and a table of it's values
  --    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
  --    Normal = {
  --        guibg = "purple",
  --    },
  --    NormalFloat = {
  --        link = 'Normal'
  --    },
  --    FloatBorder = {
  --        guifg = "purple",
  --        guibg = "purple",
  --    },
  --},
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'vertical',
  close_on_exit = true, -- close the terminal window when the process exits
  clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
   -- Change the default shell. Can be a string or a function returning a string
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'double',
    -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
    -- width = 500,
    -- height = 30,
    --row = 10,
    --col = 20,
    winblend = 0,
    --zindex = <value>,
    title_pos = 'right', 
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}
