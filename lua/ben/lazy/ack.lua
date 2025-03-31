return {
    "mileszs/ack.vim",
    config = function()

        vim.opt.runtimepath:prepend("/opt/homebrew/bin")

        -- if vim.fn.executable("ack") == 1 then
        --   vim.g.ackprg = "ack --vimgrep --smart-case"
        -- end
        -- Use the_silver_searcher (ag) if available
        if vim.fn.executable("ag") == 1 then
            vim.g.ackprg = "ag --vimgrep --smart-case"
        end

        -- Key mappings for Ack and related functionality
        -- gv will Ack after the selected text.
        vim.keymap.set("v", "gv", ":call VisualSelection('gv', '')<CR>", { silent = true })
        -- Open Ack and put the cursor in the correct position.
        vim.keymap.set("n", "<leader>g", ":Ack ") --<CR>")
        -- Search and replace selected text.
        vim.keymap.set("v", "<leader>r", ":call VisualSelection('replace', '')<CR>", { silent = true })

        -- :help cope - to see what cope is.
        -- After Ack search, display results with cope.
        vim.keymap.set("n", "<leader>cc", ":botright cope<CR>")
        -- idk research TODO XXX
        vim.keymap.set("n", "<leader>co", "ggVGy:tabnew<CR>:set syntax=qf<CR>pgg")
        -- Next search result.
        vim.keymap.set("n", "<leader>n", ":cn<CR>")
        -- Previous search result.
        vim.keymap.set("n", "<leader>p", ":cp<CR>")

        -- Ensure <Enter> works normally in the quickfix window
        vim.api.nvim_create_autocmd("BufReadPost", {
            pattern = "quickfix",
            callback = function()
                vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>", { noremap = true, silent = true })
            end,
        })

    end
}
