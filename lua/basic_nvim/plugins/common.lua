return {
  {
    "folke/lazy.nvim",
    commit = "d37a76b",
    keys = {
      { "<localleader>lz", "<cmd>Lazy<CR>", mode = "n", desc = "Lazy dash" },
    },
  },
  {
    "folke/which-key.nvim",

      -- stylua: ignore start
    keys = {
      "<leader>", "<localleader>", '"', "'", "`", "c", "v", "g",
      { "<localleader>hK", function() vim.cmd("WhichKey") end, mode = "n", desc = "Which-key all keymaps"},
      { "<localleader>hk", function() vim.cmd("WhichKey " .. vim.fn.input("WhichKey: ")) end,
        mode = "n", desc = "Which-key query lookup"},
    },
    -- stylua: ignore end
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        b = { name = "buffer" },
        f = { name = "find" },
        h = { name = "harpoon" },
        l = { name = "lsp" },
        o = { name = "org" },
        p = { name = "project" },
        t = { name = "tab" },
        w = { name = "window" },
      }, { prefix = "<leader>" })

      wk.register({
        c = { name = "compile" },
        h = { name = "help" },
        t = { name = "term" },
        v = { name = "Venv" },
      }, { prefix = "<localleader>" })
    end,
  },
  {
    "mbbill/undotree",
    lazy = false,
    keys = {
      -- stylua: ignore start
      {"<localleader>u", "<cmd>UndotreeToggle<CR>", mode = "n", desc = "Toggle UndoTree"},
      -- stylua: ignore end
    },
  },
  { "nvim-lua/plenary.nvim" }, -- used by other plugins for implementation
}
