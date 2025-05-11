return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = "hide",
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        }
      },
    })
    vim.keymap.set('n', '\\', ':Neotree toggle<cr>', { desc = 'NeoTree toggle' })
    vim.keymap.set('n', '|', ':Neotree toggle current reveal_force_cwd<cr>', { desc = 'NeoTree toggle fill window and cwd' })
  end,
}
