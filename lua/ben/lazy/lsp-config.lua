return {
    "neovim/nvim-lspconfig",
    --event = "LazyFile",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("lspconfig").pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            --ignore = {'W391'},
                            maxLineLength = 88
                        }
                    }
                }
            }
        })
    end
}
