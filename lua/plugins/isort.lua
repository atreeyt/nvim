return {
    {
        "jjvanvuren/isort.nvim",
        lazy = true,
        event = "LazyFile",
        ft = { "python" },
        opts = { sort_on_save = true, keymap = "<leader>ci" },
    },
}
