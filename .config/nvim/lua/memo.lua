-- Telescope Memo Integration
-- Add this to your Neovim config (e.g., ~/.config/nvim/lua/plugins/memo.lua)

local M = {}

-- Get memo directory (adjust if your memo uses a different location)
local function get_memo_dir()
  local home = os.getenv("HOME")
  return home .. "/.config/memo/_posts" -- Update this to match your memo directory
end

-- Function to open memo in a split
local function open_memo_in_split(filepath)
  vim.cmd("vsplit " .. filepath)
end

-- Telescope picker for memos
function M.search_memos()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local previewers = require("telescope.previewers")

  local memo_dir = get_memo_dir()

  pickers
    .new({}, {
      prompt_title = "Memos",
      finder = finders.new_oneshot_job({ "find", memo_dir, "-type", "f", "-name", "*.md" }, {
        entry_maker = function(entry)
          local display = entry:gsub(memo_dir .. "/", "")
          return {
            value = entry,
            display = display,
            ordinal = display,
            path = entry,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      previewer = previewers.cat.new({}),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          open_memo_in_split(selection.path)
        end)

        -- Optional: Add ctrl-x to open in horizontal split
        map("i", "<C-x>", function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.cmd("split " .. selection.path)
        end)

        -- Optional: Add ctrl-t to open in new tab
        map("i", "<C-t>", function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.cmd("tabnew " .. selection.path)
        end)

        return true
      end,
    })
    :find()
end

-- Alternative: Use ripgrep to search memo content
function M.grep_memos()
  local builtin = require("telescope.builtin")
  local memo_dir = get_memo_dir()

  builtin.live_grep({
    prompt_title = "Search Memos",
    cwd = memo_dir,
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        open_memo_in_split(selection.path or selection.filename)
      end)
      return true
    end,
  })
end

-- Function to create a new memo for the current file
function M.create_file_memo()
  local current_file = vim.fn.expand("%:p")
  local current_file_name = vim.fn.expand("%:t")

  -- Create a memo with the current file as context
  local memo_name = vim.fn.input("Memo name (or empty for file-based): ")

  if memo_name == "" then
    memo_name = "file-" .. current_file_name:gsub("%.", "-")
  end

  -- Use memo CLI to create/edit
  local memo_file = get_memo_dir() .. "/" .. memo_name .. ".md"

  -- Create file if it doesn't exist with template
  if vim.fn.filereadable(memo_file) == 0 then
    local lines = {
      "# " .. memo_name,
      "",
      "**File:** `" .. current_file .. "`",
      "",
      "## Notes",
      "",
    }
    vim.fn.writefile(lines, memo_file)
  end

  open_memo_in_split(memo_file)
end

-- Setup function to be called by lazy.nvim
function M.setup()
  -- Keybindings
  vim.keymap.set("n", "<leader>ms", M.search_memos, { desc = "Search memos" })
  vim.keymap.set("n", "<leader>mg", M.grep_memos, { desc = "Grep memos" })
  vim.keymap.set("n", "<leader>mn", M.create_file_memo, { desc = "New memo for file" })
end

return M
