return {
  {
    "L3MON4D3/LuaSnip",
    -- Make sure to load it before nvim-cmp or at least before you require("luasnip")
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
