return {
  -- tools
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   dependencies = {
  --     "rcarriga/nvim-dap-ui", -- UI for DAP
  --     "jay-babu/mason-nvim-dap.nvim", -- DAP installer
  --     "theHamsta/nvim-dap-virtual-text", -- Virtual text for inline info
  --   },
  --   config = function()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --
  --     -- Setup DAP-UI
  --     dapui.setup()
  --
  --     -- Automatically open/close DAP-UI on DAP events
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end,
  -- },
  -- {
  --   "lervag/vimtex",
  --   lazyload = true,
  --   ft = { "tex", "latex" }, -- Load only for LaTeX files
  --   config = function()
  --     -- Optional: configure vimtex, for instance:
  --     vim.g.vimtex_general_viewer = "zathura"
  --     vim.g.vimtex_view_general_option = "-reuse-instance -forward-search @tex @line @pdf"
  --     -- vim.g.vimtex_view_method = "general"
  --     vim.g.vimtex_compiler_method = "latexmk"
  --     vim.g.vimtex_view_general_option_latexmk = "-reuse-instance"
  --     vim.g.vimtex_compiler_latexmk = {
  --       build_dir = "",
  --       continuous = 1,
  --     }
  --   end,
  -- },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },

    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      -- you also will likely want nvim-cmp or some completion engine
    },

    -- see details below for full configuration options
    opts = {
      lsp = {},
      mappings = true,
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "clangd",
        "cssls",
        "tailwindcss",
        "html",
        "lua_ls",
        "texlab",
        "jdtls",
      },
    },
  },
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        -- pyright = {
        --   settings = {
        --     python = {
        --       analysis = {
        --         typeCheckingMode = "off",
        --         reportMissingImports = false,
        --       },
        --     },
        --   },
        -- },
        jdtls = {
          cmd = {
            "jdtls",
          },
          filetypes = { "java" },
          root_dir = require("lspconfig").util.root_pattern(".git", "pom.xml", "build.gradle"),
        },
        texlab = {
          settings = {
            texlab = {
              auxDirectory = ".",
              bibtexFormatter = "latexindent",
              build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = false,
                onSave = true,
              },
              chktex = {
                onEdit = false,
                onOpenAndSave = true,
              },
              diagnosticsDelay = 300,
              formatterLineLength = 80,
              forwardSearch = {
                args = {},
              },
              latexFormatter = "latexindent",
              latexindent = {
                modifyLineBreaks = true,
              },
            },
          },
        },
        clangd = {
          cmd = { "clangd", "--compile-commands-dir=build" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          root_dir = require("lspconfig").util.root_pattern("compile_commands.json", ".git"),
        },
        cmake = {
          cmd = { "cmake-language-server" },
          filetypes = { "cmake" },
          init_options = {
            buildDirectory = "build",
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".git", "compile_commands.json", "build")(fname)
              or require("lspconfig.util").vim.fs.dirname(fname)
          end,
        },

        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },

        -- typecript server settings
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {},
    },
  },
  { "saghen/blink.cmp", enabled = false },
  -- {
  --   "nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   opts = {},
  --   -- opts = function(_, opts)
  --   --   table.insert(opts.sources, { name = "emoji" })
  --   -- end,
  -- },
}
