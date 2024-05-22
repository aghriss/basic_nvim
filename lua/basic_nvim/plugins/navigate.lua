return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    -- stylua: ignore start
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end, mode = "n", desc = "Add", },
      { "<leader>hs", function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end, mode = "n", desc = "Show"},
      { "<C-j>", function() require("harpoon"):list():select(1) end, mode = "n", desc = "Go to 1"},
      { "<C-l>", function() require("harpoon"):list():select(2) end, mode = "n", desc = "Go to 2"},
      { "<C-u>", function() require("harpoon"):list():select(3) end, mode = "n", desc = "Go to 3"},
      { "<C-y>", function() require("harpoon"):list():select(4) end, mode = "n", desc = "Go to 4"},
      -- Toggle previous & next buffers stored within Harpoon list
      { "<C-tab>", function() require("harpoon"):list():prev({ui_nav_wrap = true}) end, mode = "n", desc = "Previous"},
      { "<C-S-tab>", function() require("harpoon"):list():next({ui_nav_wrap = true}) end, mode = "n", desc = "Next"},
    },
    -- stylua: ignore end
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
