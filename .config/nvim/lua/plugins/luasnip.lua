return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- Load VSCode-style snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })
      -- Custom snippet for Typst
      ls.add_snippets("typst", {
        s("mm", {
          t({ "$", "", "$" }), -- t({}) = multiline
        }),
      })

      -- Custom snippet for Lua
      ls.add_snippets("lua", {
        s("hello", {
          t('print("Hello World")'),
        }),
      })
    end,
  },
}
