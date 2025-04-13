-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local toggle = function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end
-- Map <F5> to compile the current C++ file
keymap.set("n", "<leader>o", toggle, opts)

-- keymap.set("n", "<leader>pv", ":Ex<CR>", opts)
vim.keymap.set("n", "<leader>lt", function()
  -- Run VimtexCompile
  vim.cmd("VimtexCompile")
  -- Launch Zathura with the current file's PDF
  local pdf_name = vim.fn.expand("%:r") .. ".pdf"
  os.execute("zathura " .. pdf_name .. " &")
  vim.defer_fn(function()
    os.execute([[osascript -e 'tell application "Zathura" to activate']])
  end, 100) -- Add a small delay to allow Zathura to launch
end, { desc = "Compile LaTeX and open PDF in Zathura" })

keymap.set("n", "x", '"_x')
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "<leader>pb", ":!obsidian %<CR>", opts)
keymap.set("n", "<leader>py", ":!python3 %<CR>", opts)
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Diagnostics
-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)
