vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local merge_tb = function(...)
  return vim.tbl_deep_extend("force", ...)
end
-- local xpr = {noremap = true, expr = true}

-- Colemak Keybindings {{{
----------------------
-- keymap.set({"n", "x", "o"}, "m", "h", opts)
-- keymap.set({"n", "x", "o"}, "m", "h", opts)
-- keymap.set({"n", "x", "o"}, "m", "h", opts)
keymap.set({ "n", "v" }, "m", "h", opts)
keymap.set({ "n", "v" }, "n", "j", opts)
keymap.set({ "n", "v" }, "e", "k", opts)
keymap.set({ "n", "v" }, "i", "l", opts)
-- inverse
keymap.set({ "n", "x", "o" }, "l", "m", opts)
keymap.set({ "n", "x", "o" }, "h", "n", opts)
keymap.set({ "n", "x", "o" }, "M", "H", opts)
keymap.set({ "n", "x", "o" }, "H", "M", opts)

keymap.set({ "n", "x", "o" }, "I", "L", opts)
-- Colemak Insert
keymap.set({ "n", "x", "o" }, "t", "i", opts)
keymap.set({ "n", "x", "o" }, "T", "I", opts)

keymap.set({ "n", "x", "o" }, "<c-z>", "<np>", opts)
-- tricks
keymap.set("n", "L", "mzJ`z", merge_tb(opts, { desc = "Merge lines inplace" }))

-- insert mode
keymap.set("n", "<leader>wq", "<cmd>q<CR>", { desc = "Quit window" })
keymap.set("n", "<leader>wyq", "<cmd>q!<CR>", { desc = "Force Quit window" })
keymap.set("n", "<Esc>", ":noh <CR>", { desc = "Clear highlights" })
keymap.set(
  "n",
  "<leader>sw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace current word" }
)
-- Ex
-- keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", { desc = "Project view" })
keymap.set("n", "<C-m>", "^", { desc = "Window left" })
keymap.set("n", "<C-n>", "<C-d>", { desc = "Window right" })
keymap.set("n", "<C-e>", "<C-u>", { desc = "Window down" })
keymap.set("n", "<C-i>", function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  col = tonumber(vim.opt.colorcolumn:get()[1]) - 1
  vim.api.nvim_win_set_cursor(0, { line, col })
end, { desc = "last character" })
-- Windows
keymap.set("n", "<leader>wm", "<C-w>h", { desc = "Window left" })
keymap.set("n", "<leader>wn", "<C-w>j", { desc = "Window right" })
keymap.set("n", "<leader>we", "<C-w>k", { desc = "Window down" })
keymap.set("n", "<leader>wi", "<C-w>l", { desc = "Window up" })

-- Buffers
keymap.set("n", "<leader>bk", ":confirm bd<CR>", { desc = "Kill" })
keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Buffer next" })
keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Buffer previous" })
keymap.set("n", "<leader>ss", "<cmd>w<CR>", { desc = "Buffer save" })

-- Tabs
keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "Create tab" })
keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tb", ":tabfirst<CR>", { desc = "First tab" })
keymap.set("n", "<leader>tp", ":tabprev<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tl", ":tablast<CR>", { desc = "Last tab" })
keymap.set("n", "<leader>tw", "<Esc><C-w>T", { desc = "Turn window to tab" }) -- Check collision!
-- split
keymap.set("n", "<leader>sh", ":sp<space>", { desc = "Horizontal split" })
keymap.set("n", "<leader>sv", ":vsp<space>", { desc = "Vertical split" })
-- files
keymap.set("n", "<leader>fx", "<cmd>!chmod +x %<CR>", { desc = "Make executable" })
keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- replace

keymap.set(
  "v",
  "<leader>ra",
  [["0y:%s/<C-r>0//g<Left><Left>]],
  { desc = "Replace current select" }
)

keymap.set(
  "v",
  "<leader>rs",
  [["0y:s/<C-r>0//g<Left><Left>]],
  { desc = "Replace current select" }
)

keymap.set("v", "<leader>sf", [["1y/<C-r>1<CR>]], { desc = "Search for selection" })

keymap.set(
  "x",
  "p",
  'p:let @+=@0<CR>:let @"=@0<CR>',
  { desc = "Dont copy replaced", silent = true }
)
keymap.set(
  "t",
  "<C-x>",
  vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
  { desc = "Escape terminal mode" }
)
