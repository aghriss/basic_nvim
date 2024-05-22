return {
  "nvim-tree/nvim-tree.lua",
  -- stylua: ignore start
  keys = {
    { "<leader>po", "<cmd> NvimTreeToggle <CR>", mode = "n", desc = "project open"},
  },
  -- stylua: ignore end
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
      },
      respect_buf_cwd = false,
      reload_on_bufenter = false,
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = false,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      -- sync_root_with_cwd = true,
      actions = { open_file = { resize_window = true, quit_on_open = true } },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        local set_cwd = function(node, ...)
          node = node or require("nvim-tree.lib").get_node_at_cursor()
          if node.name == ".." then
            require("nvim-tree.actions.root.change-dir").fn("..")
            return
          end
          if node.fs_stat.type == "directory" then
            vim.cmd(":cd " .. node.absolute_path)
          else
            vim.cmd(":cd " .. node.parent.absolute_path)
          end
        end
        -- stylua: ignore start
        vim.keymap.set("n", "<leader>r", api.tree.change_root_to_node, opts("set root"))
        vim.keymap.set("n", "<leader>cd", set_cwd, opts("set cwd"))
        vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
        vim.keymap.set("n", "a", api.fs.create, opts("Create"))
        vim.keymap.set("n", "m", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
        vim.keymap.set("n", "/", api.live_filter.start, opts("Filter"))
        vim.keymap.set("n", "N", api.node.navigate.sibling.last, opts("Last Sibling"))
        vim.keymap.set("n", "E", api.node.navigate.sibling.first, opts("First Sibling"))
        vim.keymap.set("n", "q", api.tree.close, opts("Close"))
        vim.keymap.set("n", "<ESC>", api.tree.close, opts("Close"))
        vim.keymap.set("n", "'", api.marks.toggle, opts("Toggle Bookmark"))
        vim.keymap.set("n", "i", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
        vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
        vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
        vim.keymap.set("n", "Y", api.fs.copy.filename, opts("Copy Name"))
        vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
        vim.keymap.set("n", "V", api.node.open.vertical, opts("Vertical Split"))
        vim.keymap.set("n", "H", api.node.open.horizontal, opts("Horizontal Split"))
        -- stylua: ignore end
      end,

      view = {
        -- hide_root_folder = false,
        adaptive_size = true,
        side = "left",
        width = 20,
        preserve_window_proportions = true,
        float = {
          enable = true,
          open_win_config = function()
            return {
              relative = "editor",
              -- border = "rounded",
              border = "none",
              -- border = "shadow",
              width = 30,
              height = vim.api.nvim_win_get_height(0),
              row = 1,
              col = 0,
            }
          end,
        },
      },
      git = {
        enable = false,
        ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      renderer = {
        root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ":t")
        end,
        highlight_git = true,
        highlight_opened_files = "none",

        indent_markers = {
          enable = false,
        },

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },

          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    })
  end,
}
