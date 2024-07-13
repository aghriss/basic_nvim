local opt = vim.opt
local g = vim.g
-------------------------------------- options ---------------------------------
-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 50
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
-- opt.cmdheight = 0
g.transparency = 0.4

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.fillchars = { eob = " " }

-- Lines
opt.wrap = false
opt.listchars = "eol:↵,nbsp: ,trail: ,tab:  "
opt.list = true
-- Numbers
opt.number = true
-- opt.numberwidth = 3
opt.relativenumber = true
-- opt.ruler = true

-- disable nvim intro
opt.colorcolumn = "88"
opt.shortmess:append("sI")
opt.signcolumn = "auto"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
-- number of lines betwee cursor and bottom
opt.scrolloff = 40
-- timeout when pressing leader key before showing which-key menu
opt.timeoutlen = 700

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
opt.swapfile = false
opt.backup = false
opt.undodir = "$HOME/.local/state/nvim/undotree"
opt.undofile = true

--cursor blinking
opt.mouse = ""
vim.opt.guicursor = {
  "n-v-c:block-Cursor/lCursor-blinkwait100-blinkon500-blinkoff200",
  "i-ci:ver25-Cursor/lCursor-blinkwait200-blinkon350-blinkoff200",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon150-blinkoff150",
}
----------------------------- options ------------------------------------------
-- disable some default providers
-- for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
for _, provider in ipairs({ "node", "perl", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

---------------------------- autocmds ------------------------------------------
-- dont list quickfix buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
