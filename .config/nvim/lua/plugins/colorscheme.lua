return {
	-- [[ nord.nvim ]]
	"gbprod/nord.nvim",
	lazy = false,
	name = "nord",
	priority = 1000,
	config = function()
		require("nord").setup({})
		vim.cmd.colorscheme("nord")
	end,

	--[[
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
]]
	--
}
