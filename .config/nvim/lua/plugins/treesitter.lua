return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    opts = {
      ensure_installed = {
        "ninja",
        "rst",
        "javascript",
        "bash",
        "c",
        "diff",
        "html",
        "typescript",
        "css",
        "gitignore",
        "graphql",
        "http",
        "jsdoc",
        "jsonc",
        "markdown",
        "markdown_inline",
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
    "romgrk/nvim-treesitter-context",
    opts = function()
      local tsc = require("treesitter-context")

      LazyVim.toggle.map("<leader>ut", {
        name = "Treesitter Context",
        get = tsc.enabled,
        set = function(state)
          if state then
            tsc.enable()
          else
            tsc.disable()
          end
        end,
      })

      return { mode = "cursor", max_lines = 3 }
    end,
  },
}
