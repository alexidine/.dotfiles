return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua formatter
				null_ls.builtins.formatting.black, -- python formatter
				null_ls.builtins.formatting.isort, -- python formatter (for imports i think)
			},
		})

		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "[F]ix [F]ormat" })
	end,
}
