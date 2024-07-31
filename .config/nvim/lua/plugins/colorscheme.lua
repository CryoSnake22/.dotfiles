return {
  {
    "sainnhe/sonokai",
    priority = 999,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda"
      vim.cmd.colorscheme("sonokai")
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 999,
  --   config = function()
  --     vim.g.tokyonight_transparent_background = "1"
  --     vim.g.tokyonight_enable_italic = "1"
  --     vim.g.tokyonight_style = "night"
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },
}
