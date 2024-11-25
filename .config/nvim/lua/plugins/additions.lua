return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
              -- auto close
              -- vimc.cmd("Neotree close")
              -- OR
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
      })
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        preset = {
          header = [[
⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢊⠉⠀⠀⠐⠁⠀⠀⠀⠀⠀⠈⠄⠀⠀⢉⠓⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠀⠀⠀⠀⠀⠛⡀⠀⠀⠀⠀⠀⣂⠰⠀⠀⠀⡀⠈⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢴⠱⠀⠀⠀⠀⠀⢰⠅⣷⣶⣻⣩⣏⣟⣥⡨⡄⠀⢀⠁⠀⠐⠙⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⢀⣆⠀⠀⠐⡈⠀⠐⠋⠀⠀⠀⠀⠀⠀⡀⠉⠁⠀⠀⠀⠀⠰⠢⠼⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠃⠀⠈⠀⠀⠀⠈⠀⠀⠀⠀⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⣠⢆⣐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⡧⠔⡢⠀⠀⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⠀⠀⣰⣗⡑⣁⠞⠓⢄⠠⠄⠀⠀⠀⠀⠄⠀⠀⠀⢄⡰⠛⠫⡈⠫⣬⣐⡄⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢼⠂⢐⣹⠊⢰⠃⠀⠀⠀⠉⠢⣂⣤⣖⣲⣤⡤⠤⠂⠃⠀⠀⠀⢈⠘⣧⡿⠂⢸⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⢠⢾⡇⠀⢻⡼⠋⢅⠀⠀⠀⠀⠀⠑⠉⠤⠀⠈⠋⠀⠀⠀⠀⠀⠀⡎⢻⣜⠃⠀⣸⢗⡌⠢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡜⠇⠀⡟⢦⣷⡀⠀⠳⢃⢈⢆⠀⠀⠠⠠⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⣀⠜⣌⠛⢁⠄⣰⣿⣣⢛⠀⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠱⠀⢄⡈⢢⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⣎⣻⣭⠹⢿⡙⠲⣄⡠⠔⠊⢽⣽⢀⠄⠀⢻⣼⣿⣷⡀⠀⠀⠂⣢⠉⡄⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠬⠂⠀⠊⣰⣿⣿⣏⢸⠇⢀⢳⢀⣀⠀⠀⠀⠀⠀⡀⠤⠤⢀⠇⠆⠀⠀⠀⠈⠆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡠⢞⢣⠖⠋⠁⠀⠀⠀⣅⣱⢣⣆⣰⣾⠿⠹⠀⠂⠿⢸⢿⣿⡏⣿⣄⠀⠤⠌⢃⡸⡄⠠⠀⠀⣀⣀⣀⠀⠀⠀⡰⢀⢊⣀⠀⢠⣾⡇⢿⣿⢋⢾⠄⡀⠘⣄⣀⡠⢐⣂⠒⢸⠁⢦⠀⡘⢸⠀⠀⠰⢀⣀⠸⡀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡜⢉⢠⠏⠀⠀⠀⠀⣀⠠⢍⣸⠀⢰⠖⢱⠀⢇⠡⠀⠠⢆⡎⣿⠀⣾⢿⣦⠈⡖⣶⠃⠘⠧⠔⠋⠉⠉⠉⠤⠤⢾⠋⣷⣖⡄⣠⢿⠙⣧⢸⠃⠞⡸⠀⠈⠎⠠⣶⣶⣶⣥⡴⡓⢄⠀⢩⠃⡇⠀⠀⣰⠋⠡⡀⣷⣀⡀⠀⠀
⠀⠀⠀⣰⠋⡀⢆⣟⡢⢠⡔⠊⠁⣀⡀⢤⡽⡂⠘⡚⣞⠬⢔⡷⢡⢠⠰⠆⠻⠈⣯⣘⢟⢷⡾⣝⠃⠠⠆⠀⡰⠶⡾⠖⠀⠄⢄⢠⣟⣼⡞⢁⣼⡰⠇⣜⠋⣞⢱⠀⠸⠠⠀⠈⠉⠀⠰⠆⢰⢆⣇⢠⡬⠁⠀⠀⠚⢂⠀⠙⠁⠃⠙⢆⠀
⠀⢀⡴⠁⠀⠰⣾⣧⢁⠂⢨⠂⠁⠁⠉⠉⣭⠀⠕⠊⡀⠀⠐⠫⣆⣄⡀⣆⠘⠐⡔⢣⠀⠸⡟⣇⡁⠀⡀⠀⠨⠤⠤⠅⠀⠀⠀⣂⡽⢁⡇⢲⣵⢏⡜⠀⠈⠈⡆⠰⣀⡋⠄⠛⠛⠶⠀⢀⡞⡸⡈⡈⠀⠀⡠⠐⠘⠁⠙⠢⣄⣜⢦⠘⣇
⢀⡞⠀⠠⡠⣠⣽⡏⢴⣤⢄⡀⠀⠀⡈⠀⣾⢀⠀⠀⠀⣀⠤⠂⠛⢈⢧⣸⠸⠒⡨⣆⠳⣄⡈⠒⢷⣤⣸⣿⠀⠤⠦⢰⣟⣠⡷⠋⡰⠚⣁⣽⠂⢞⡤⠆⠰⣠⢎⠀⡀⡤⠶⠶⠦⣀⡀⢠⢡⡧⠠⠴⡂⠁⠀⠀⢀⠰⠀⠀⠨⡻⣌⢫⡼
⡜⠀⠀⠤⠊⠀⢻⣷⠋⡤⠁⠌⠂⠀⢀⠃⠋⠀⢀⠠⠊⠀⢀⠠⠀⠑⢁⣽⠟⢆⠹⢌⠑⠳⠬⣏⡛⠒⡍⠛⢻⣿⣿⡟⠉⢃⠔⠲⣯⠯⠛⠊⣩⠎⠄⠉⠍⠑⠃⠉⣀⣀⣀⠀⠀⠉⠀⡹⠋⢐⢿⠇⠠⠐⠀⠀⠀⠀⠂⠀⠄⠈⠨⢯⣶
⠃⠀⠐⠀⡀⠀⠀⡹⡄⠀⠻⢦⣤⡀⠈⠒⢜⡁⠀⠀⡀⠌⠀⢀⡀⠂⠈⢀⠠⢄⣑⡄⠁⠒⠢⡄⠴⠀⢸⢰⣈⣛⣋⣇⡘⡜⠄⡰⠀⠔⠉⠁⠀⠀⠈⠀⠈⠉⠈⠉⠉⠈⠙⠉⠀⠰⢼⠀⠀⡘⠄⠀⡀⢄⠀⢀⠠⠀⢀⠀⠦⠀⠀⠀⣻
⡁⠁⠀⢤⡅⠀⠀⠐⢱⡄⠀⠀⠙⠋⠠⠑⠀⠑⠄⠘⠀⠀⠴⠁⢠⡒⠖⠉⠉⠉⠉⠉⠉⠉⠉⠷⡄⠃⠡⢷⣵⣄⠠⢴⣬⣱⣰⡱⠈⠉⠉⠉⠛⠛⠛⠛⠉⠉⠉⠉⠐⠦⡀⠀⠀⠀⣼⣀⠀⣇⠀⠀⠈⠐⠀⠀⠂⠉⠀⠀⠀⠀⠀⠈⠩
⡄⠀⠀⠀⠀⡀⠀⠀⠀⠘⠰⠤⠐⠠⣀⠀⠀⠀⢚⡄⠄⠀⢀⡠⠊⠀⠀⠈⠉⠁⠀⠀⠀⠀⠢⡀⡈⠛⠒⢷⠾⠾⠶⠶⠀⠀⠈⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠂⠒⠀⠀⠊⠻⣿⣶⣿⠈⡷⠸⡁⠀⠀⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰
      ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
  {
    -- git worktree
    "awerebea/git-worktree.nvim",
    branch = "handle_changes_in_telescope_api",
    config = function()
      require("telescope").load_extension("git_worktree")
      local Worktree = require("git-worktree")

      -- op = Operations.Switch, Operations.Create, Operations.Delete
      -- metadata = table of useful values (structure dependent on op)
      --      Switch
      --          path = path you switched to
      --          prev_path = previous worktree path
      --      Create
      --          path = path where worktree created
      --          branch = branch name
      --          upstream = upstream remote name
      --      Delete
      --          path = path where worktree deleted

      Worktree.on_tree_change(function(op, metadata)
        if op == Worktree.Operations.Switch then
          print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
        end
      end)
    end,
    keys = {
      {
        "<leader>gS",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
        desc = "Switch and Delete a worktrees",
      },
      {
        "<leader>gC",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "Create a worktree",
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>a",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
}
