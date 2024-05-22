return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
      -- stylua: ignore start
    keys = {
      {"<leader>fb","<cmd> Telescope buffers <CR>", mode='n',desc= "find in buffers"},
      {"<leader>fm","<cmd> Telescope marks <CR>", mode='n',desc= "find marks"},
      {"<leader>fp","<cmd> Telescope find_files <CR>", mode='n',desc= "find in project"},
      {"<leader>bg","<cmd> Telescope current_buffer_fuzzy_find <CR>", mode='n',desc= "buffer grep"},
      {"<leader>bo","<cmd> Telescope oldfiles <CR>", mode='n',desc= "buffer open recent"},
      {"<leader>gc","<cmd> Telescope git_commits <CR>", mode='n',desc= "git commits"},
      {"<leader>gf","<cmd> Telescope git_files <CR>", mode='n',desc= "git files"},
      {"<leader>gs","<cmd> Telescope git_status <CR>", mode='n',desc= "git status"},
      {"<leader>pg","<cmd> Telescope live_grep <CR>", mode='n',desc= "project grep"},
      {"<leader>pt","<cmd> Telescope terms <CR>", mode='n',desc= "project terminals"},
      {"<localleader>ht","<cmd> Telescope help_tags <CR>", mode='n',desc= "Help page"},
      -- stylua: ignore end
      -- {"<leader>pg","<cmd> Telescope find_files cwd=/ find_command=fd cwd=/sync no_ignore=true<CR>", mode="n",desc= "Find all"},
    },
    config = function()
      require("telescope").setup({
          defaults = {
            vimgrep_arguments = {
              "rg",
              "-L",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
            },
            prompt_prefix = "   ",
            selection_caret = "  ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
              },
              vertical = {
                mirror = false,
              },
              width = 0.87,
              height = 0.80,
              preview_cutoff = 120,
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = { "node_modules" },
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = { "truncate" },
            winblend = 0,
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            mappings = {
            n = {
              ["q"] = require("telescope.actions").close,
              ["n"] = require("telescope.actions").move_selection_next,
              ["N"] = require("telescope.actions").move_to_middle,
              ["e"] = require("telescope.actions").move_selection_previous,
              ["<C-h>"] = require("telescope.actions").select_horizontal,
            },
            i = {
              ["<C-q>"] = require("telescope.actions").close,
              ["<C-n>"] = require("telescope.actions").move_selection_next,
              ["<C-l>"] = require("telescope.actions").move_to_middle,
              ["<C-e>"] = require("telescope.actions").move_selection_previous,
              ["<C-h>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
            }
            },
            },
          })
      -- load extensions
        for _, ext in ipairs({
        --"themes", 
        "terms", 
      }) do
        require("telescope").load_extension(ext)
      end
    end,
  },
}
