return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "basedpyright",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.basedpyright.setup({})

      local diagnostics_active = true
      function ToggleDiagnostics()
        diagnostics_active = not diagnostics_active
        if diagnostics_active then
          vim.diagnostic.show()
          print("Diagnostics enabled")
        else
          vim.diagnostic.hide()
          print("Diagnostics disabled")
        end
      end

      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          if not diagnostics_active then
            vim.diagnostic.hide()
          end
        end
      })

      vim.keymap.set("n", "<leader>td", ":lua ToggleDiagnostics()<CR>", { desc = "[T]oggle [D]iagnostics", noremap = true, silent = true })

      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
      vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, { desc = "[G]oto [R]eferences" })
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type [D]efinition" })
      vim.keymap.set("n", "<leader>ds", require('telescope.builtin').lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
      vim.keymap.set("n", "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
    end,
  },
}
