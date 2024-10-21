require('lualine').setup {
  options = {
    theme = "auto",
    component_separators = '',
    -- section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', right_padding = 2 } },
    lualine_b = {'filename', 'branch', 'diff', 'diagnostics'},
    lualine_c = {
         --[[ add your center compoentnts here in place of this comment ]]
    },
    lualine_x = {'searchcount', 'selectioncount'},
    lualine_y = { 'filetype', 'progress', 'searchcount' },
    lualine_z = {
      { 'location', left_padding = 2 },
      -- { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
