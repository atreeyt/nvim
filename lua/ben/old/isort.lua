return {
    { 
        "fisadev/vim-isort",
        config = function()
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.py",
                callback = function()
                    vim.cmd("Isort")
                end,
            })
        end
    }
}
