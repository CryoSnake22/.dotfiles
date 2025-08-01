return {
  --
  -- {
  --   "cryosnake22/sonokai_plexed",
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     vim.g.sonokai_transparent_background = "1"
  --     vim.g.sonokai_enable_italic = "1"
  --     vim.g.sonokai_style = "andromeda"
  --     vim.cmd.colorscheme("sonokai")
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   priority = 1000,
  --   name = "rose-pine",
  --   config = function()
  --     vim.cmd("colorscheme rose-pine")
  --   end,
  -- },
  {
    "vague2k/vague.nvim",
    -- priority = 999,
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
        transparent = true,
        enable_italic = "1",
      })
      -- vim.cmd.colorscheme("vague")
    end,
  },
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_transparent_background = "2"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda"
      -- vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "CryoSnake22/vagueZ.nvim",
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vagueZ").setup({
        -- optional configuration here
        transparent = true,
        enable_italic = "1",
      })
      vim.cmd.colorscheme("vagueZ")
    end,
  },
  {
    "yorumicolors/yorumi.nvim",
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
    --
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_transparent_background = "1"
      vim.g.tokyonight_enable_italic = "1"
      vim.g.tokyonight_style = "night"
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
