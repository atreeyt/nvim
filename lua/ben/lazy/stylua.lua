return {
	"ckipp01/stylua-nvim",
	build = "cargo install stylua", -- Build/install command.
	config = function()
		-- Format on save for Lua files
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.lua",
			callback = function()
				require("stylua-nvim").format_file()
			end,
		})
	end,
}
