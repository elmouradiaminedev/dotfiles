return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				sections = {
					lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
				},
				theme = "catppuccin",
				globalstatus = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
		})
	end,
}
