return {
  {
    -- Harpoon
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Mark file for harpoon",
      },
      {
        "<leader>.",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Show Marked File",
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Open Marked File 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Open Marked File 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Open Marked File 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Open Marked File 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon.ui").nav_file(5)
        end,
        desc = "Open Marked File 5",
      },
    },
  },
  {
    -- Wakatime
    "wakatime/vim-wakatime",
  },
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
    -- git worktree
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
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
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    keys = {
      {
        "<leader>tlu",
        function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Plug>(toggle-lsp-diag-underline)", true, true, true),
            "n",
            true
          )
        end,
        desc = "Toggle underline diagnostics",
      },
      {
        "<leader>tls",
        function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Plug>(toggle-lsp-diag-signs)", true, true, true),
            "n",
            true
          )
        end,
        desc = "Toggle signs diagnostics",
      },
      {
        "<leader>tlv",
        function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Plug>(toggle-lsp-diag-vtext)", true, true, true),
            "n",
            true
          )
        end,
        desc = "Toggle virtual text diagnostics",
      },
      {
        "<leader>tlp",
        function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Plug>(toggle-lsp-diag-update_in_insert)", true, true, true),
            "n",
            true
          )
        end,
        desc = "Toggle diagnostics update in insert mode",
      },
      {
        "<leader>tld",
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(toggle-lsp-diag)", true, true, true), "n", true)
        end,
        desc = "Toggle all diagnostics",
      },
      {
        "<leader>tldd",
        function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Plug>(toggle-lsp-diag-default)", true, true, true),
            "n",
            true
          )
        end,
        desc = "Toggle default diagnostics",
      },
      {
        "<leader>tldo",
        function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Plug>(toggle-lsp-diag-off)", true, true, true),
            "n",
            true
          )
        end,
        desc = "Toggle diagnostics off",
      },
      {
        "<leader>tldf",
        function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Plug>(toggle-lsp-diag-on)", true, true, true),
            "n",
            true
          )
        end,
        desc = "Toggle diagnostics on",
      },
    },
  },
}
