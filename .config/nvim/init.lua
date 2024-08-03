if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd
require("config.lazy")

local function get_class_name()
  local node = vim.treesitter.get_node()
  while node do
    if node:type() == "class_definition" then
      local name_node = node:field("name")[1]
      if name_node then
        local class_name = vim.treesitter.get_node_text(name_node, 0)
        return class_name
      end
    end
    node = node:parent()
  end
  return nil
end

local function render_scene()
  local class_name = get_class_name()
  if not class_name then
    print("No class name found at cursor!")
    return
  end

  local file_path = vim.fn.expand("%:p")
  local dir_name = vim.fn.expand("%:p:h")
  local file_name = vim.fn.expand("%:t:r")
  local video_path = dir_name .. "/media/videos/" .. file_name .. "/480p15/" .. class_name .. ".mp4"

  local cmd = string.format("manim -ql '%s' '%s' && mpv '%s'", file_path, class_name, video_path)

  require("toggleterm.terminal").Terminal:new({ cmd = cmd }):toggle()
end

vim.keymap.set("n", "<leader>mm", render_scene, { noremap = false, silent = true })

-- Terminal Shenanigans
local Terminal = require("toggleterm.terminal").Terminal
_G.MUtils = {}
-- gets the path of the file currently in
MUtils.filepathext = vim.fn.expand("%")
MUtils.filepathnoext = vim.fn.expand("%:r")

-- function that creates the new terminal instance
local cppcompile = Terminal:new({
  -- cmd = lg_cmd,
  count = 5,
  direction = "float",
  float_opts = {

    border = "double",
    width = function()
      return vim.o.columns
    end,
    height = function()
      return vim.o.lines
    end,
  },
  -- function to run on opening the terminal
  on_open = function(term)
    local cmd_to_run = tostring("g++ -std=c++20 " .. MUtils.filepathext .. " -o " .. MUtils.filepathnoext .. "\n")
    -- string.format("g++ -std=c++20 " .. filepath .. "-o " .. filepath .. ":r \n")
    vim.cmd("startinsert!")

    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    vim.defer_fn(function()
      vim.api.nvim_chan_send(term.job_id, cmd_to_run)
      vim.api.nvim_chan_send(term.job_id, "./" .. MUtils.filepathnoext .. "\n")
    end, 100)
  end,
})

MUtils.edit = function(fn, line_number)
  local edit_cmd = string.format(":e %s", fn)
  if line_number ~= nil then
    edit_cmd = string.format(":e +%d %s", line_number, fn)
  end
  vim.cmd(edit_cmd)
end

MUtils.cppcompile = function()
  cppcompile:toggle()
end

vim.keymap.set("n", "<leader>cp", _G.MUtils.cppcompile, { silent = true })
