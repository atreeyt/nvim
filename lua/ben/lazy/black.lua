return {
    "psf/black",
    config = function()
        vim.g.black_virtualenv = "~/.venv/black/"
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.py",
            callback = function()
                vim.cmd("Black")
            end,
        })
    end
}

