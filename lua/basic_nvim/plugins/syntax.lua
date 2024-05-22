return {
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        },
      })
      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 3, -- Maximum number of lines to show for a single context
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        -- mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = "_",
        zindex = 2, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    cmd = {
      "TSInstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSModuleInfo",
      "TSInstallAll",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bibtex",
          "c",
          "css",
          "html",
          "javascript",
          "json",
          "latex",
          "lua",
          "markdown",
          "markdown_inline",
          "org",
          "typescript",
          "rust",
          "python",
          "vim",
          "query",
          -- "typst",
        },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "org" },
        },
        playground = {
          enable = true,
          keybindings = {
            toggle_query_editor = "y",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
        indent = { enable = true },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "NvChad/nvim-colorizer.lua",
      "nvim-treesitter/playground",
    },
  },
}
