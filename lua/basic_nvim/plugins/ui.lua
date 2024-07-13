return {
  {
    "aghriss/base46.nvim",
    lazy = false,
    priority = 1000,
    build = function()
      require("base46").compile()
    end,
    opts = {
      custom_themes_path = "$HOME/.config/nvim/assets/themes",
      theme1 = "dark",
      transparency = true,
      -- transparency = false,
    },
    config = function(_, opts)
      require("base46").setup(opts)
      require("base46").load_all_highlights()
    end,
  },
  {
    "aghriss/statusline.nvim",
    lazy = false,
    config = function()
      require("statusline").setup({
        theme = "vscode",
        overriden_modules = nil,
        position_min_width = 40,
        -- use_base46 = true,
      })
    end,

    dependencies = {
      {
        "nvim-tree/nvim-web-devicons", -- for file name icon
      },
    },
  },
}
