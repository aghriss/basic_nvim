return {
  {
    "NvChad/nvterm",
    keys = {
      {
        "<localleader>th",
        function()
          require("nvterm.terminal").toggle("horizontal")
        end,
        mode = "n",
        desc = "Toggle h-term",
      },
      {
        "<localleader>tv",
        function()
          require("nvterm.terminal").toggle("vertical")
        end,
        mode = "n",
        desc = "Toggle v-term",
      },
    },

    config = function()
      require("nvterm").setup({})
    end,
  },
}
