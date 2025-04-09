return {
	"preservim/nerdtree",
	config = function()
		-- Global Variables
		vim.g.NERDTreeWinPos = "left"
		vim.g.NERDTreeShowHidden = 1
		vim.g.NERDTreeIgnore = { "%.pyc$", "__pycache__" }
		vim.g.NERDTreeWinSize = 35

		-- Key Mappings
		vim.api.nvim_set_keymap('n', '<leader>nn', ':NERDTreeToggle<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<leader>nb', ':NERDTreeFromBookmark<Space>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<leader>nf', ':NERDTreeFind<CR>', { noremap = true })
	end
}
