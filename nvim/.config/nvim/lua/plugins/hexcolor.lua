return {
  "NvChad/nvim-colorizer.lua",
  opts = {
    filetypes = { "*" }, -- Enable for all filetypes
    user_default_options = {
      RGB = true,        -- #RGB hex codes
      RRGGBB = true,     -- #RRGGBB hex codes
      names = false,     -- Disable color names like 'red'
      RRGGBBAA = true,   -- #RRGGBBAA hex codes
      rgb_fn = true,     -- rgb() and rgba() functions
      hsl_fn = true,     -- hsl() and hsla() functions
      css = true,        -- Enable all css features: rgb_fn, hsl_fn, names, etc.
      tailwind = true,   -- Enable tailwind colors
      sass = { enable = true }, -- Enable sass colors: #RRGGBB or #RGB
      always_update = true,
    },
  },
  config = function(opts)
    require('colorizer').setup(opts)
  end,
}
