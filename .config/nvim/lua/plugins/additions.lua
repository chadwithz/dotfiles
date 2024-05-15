return {
  {
    -- Auto Tag HTML
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      ---@type TSConfig
      opts = {
        autotag = {
          enable = true,
        },
      },
    },
  },
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
    end
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
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    config = function()
      local logo = [[
        =================     ===============     ===============   ========  ========
        \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
        ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
        || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
        ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
        || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
        ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
        || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
        ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
        ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
        ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
        ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
        ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
        ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
        ||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   ||
        ||.=='    _-'                                                     `' |  /==.||
        =='    _-'                                                            \/   `==
        \   _-'                                                                `-_   /
        `''                                                                      ``'
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      require('dashboard').setup {
        theme = "doom",
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = LazyVim.telescope("files"),                                 desc = " Find File",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
            { action = [[lua LazyVim.telescope.config_files()()]],                 desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }
    end
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
          "<leader>H",
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
  }
}
