return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      name = ".venv", -- prefer .venv in each project
      auto_refresh = true, -- refresh list when you open :VenvSelect
      notify_user_on_venv_activation = true,
    },
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select venv" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select last venv" },
    },
  },
  {
    "R-nvim/R.nvim",
    -- Only required if you also set defaults.lazy = true
    lazy = false,
    -- R.nvim is still young and we may make some breaking changes from time
    -- to time (but also bug fixes all the time). If configuration stability
    -- is a high priority for you, pin to the latest minor version, but unpin
    -- it and try the latest version before reporting an issue:
    -- version = "~0.1.0"
    config = function()
      -- Create a table with the options to be passed to setup()
      ---@type RConfigUserOpts
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end,
        },
        R_args = { "--quiet", "--no-save" },
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_mappings = { -- Object browser keymap
          c = "class", -- Call R functions
          ["<localleader>gg"] = "head({object}, n = 15)", -- Use {object} notation to write arbitrary R code.
          v = function()
            -- Run lua functions
            require("r.browser").toggle_view()
          end,
        },
        disable_cmds = {
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = "on startup"
        opts.objbr_auto_start = true
      end
      require("r").setup(opts)
    end,
  },
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
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
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
      inlay_hints = { enabled = false },
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
          cmd = { "clangd", "--background-index", "--compile-commands-dir=cmake-build" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          -- root_dir = require("lspconfig").util.root_pattern("cmake-build/compile_commands.json", ".git"),
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
