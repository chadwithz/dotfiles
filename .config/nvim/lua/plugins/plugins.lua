return {
  {
    -- Transparent effect
    "xiyaowong/nvim-transparent",
    opts = {
      enable = true,
    },
  },

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
    -- Discord Presence
    "andweeb/presence.nvim",
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
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            --auto close
            require("neo-tree").close_all()
          end,
        },
      },
    },
  },
  { "APZelos/blamer.nvim" },
  {
    "heavenshell/vim-jsdoc",
  },
  {
    "cseickel/diagnostic-window.nvim",
    requires = { "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>xx", "<cmd>DiagWindowShow<cr>", desc = "Open Diagnostic Window" },
      { "q", "<cmd>:q<cr>" },
    },
  },
}
