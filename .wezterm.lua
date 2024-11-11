-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Rosé Pine (Gogh)'

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
-- config.win32_system_backdrop = "Acrylic" 
config.tab_bar_at_bottom = true
config.tab_max_width = 13
config.use_fancy_tab_bar = true

config.default_prog = { 'C:\\Windows\\System32\\wsl.exe', '~' }
-- and finally, return the configuration to wezterm
bar.apply_to_config(config)
config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
-- config.font = wezterm.font('GeistMono NFM SemiBold')

-- config.font_rules = {
--
-- -- normal-intensity-and-italic
--   {
--     intensity = 'Normal',
--
--     italic = true,
--     font = wezterm.font {
--       family = 'RobotoMono Nerd Font Mono',
--       italic = true
--     },
--   }
-- }


config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font_size = 10

-- config.colors = {
--     background = '#0f0f0f'
-- }

-- config.font = wezterm.font('FiraCode Nerd Font Mono Med')

-- config.window_background_gradient = {
--   orientation = 'Vertical',
--
--   -- Specifies the set of colors that are interpolated in the gradient.
--   colors = {
--     '#232136',
--     '#06040d',
--     '#191724',
--   },
--
--   -- Instead of specifying `colors`, you can use one of a number of
--   -- predefined, preset gradients.
--   -- A list of presets is shown in a section below.
--   -- preset = "Warm",
--
--   -- Specifies the interpolation style to be used.
--   -- "Linear", "Basis" and "CatmullRom" as supported.
--   -- The default is "Linear".
--   interpolation = 'Basis',
--
--   -- How the colors are blended in the gradient.
--   -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
--   -- The default is "Rgb".
--   blend = 'Rgb',
--
--   -- To avoid vertical color banding for horizontal gradients, the
--   -- gradient position is randomly shifted by up to the `noise` value
--   -- for each pixel.
--   -- Smaller values, or 0, will make bands more prominent.
--   -- The default value is 64 which gives decent looking results
--   -- on a retina macbook pro display.
--   -- noise = 64,
--
--   -- By default, the gradient smoothly transitions between the colors.
--   -- You can adjust the sharpness by specifying the segment_size and
--   -- segment_smoothness parameters.
--   -- segment_size configures how many segments are present.
--   -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
--   -- 1.0 is a soft edge.
--
--   -- segment_size = 11,
--   -- segment_smoothness = 0.0,
-- }
return config
