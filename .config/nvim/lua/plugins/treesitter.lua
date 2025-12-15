return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },

    -- tag = "v0.9.1",
    opts = {
      ensure_installed = {
        "prisma",
        "cpp",
        "go",
        "haskell",
        "python",
        "ninja",
        "rst",
        "javascript",
        "java",
        "bash",
        "c",
        "diff",
        "c_sharp",
        "html",
        "typescript",
        "css",
        "gitignore",
        "graphql",
        "http",
        "jsdoc",
        "jsonc",
        "printf",
        "query",
        "json",
        "scss",
        "xml",
        "yaml",
        "sql",
        "vim",
        "vimdoc",
        "lua",
        "luap",
        "luadoc",
        "rust",
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = function()
      local tsc = require("treesitter-context")

      return { mode = "cursor", max_lines = 3 }
    end,
  },
}
