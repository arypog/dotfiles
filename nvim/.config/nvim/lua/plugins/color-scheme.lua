return  {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        transparent_background = true,
      })
      -- vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        transparent_mode = true
      })
      -- vim.cmd("colorscheme gruvbox")
    end
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({ disable_background = true })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        transparent = true,         -- do not set background color
      })
      -- vim.cmd("colorscheme kanagawa")

    end,
  },
  -- vim.cmd.colorscheme "catppuccin",
  -- vim.cmd("colorscheme tokyonight")
  -- vim.cmd("colorscheme gruvbox")
}
