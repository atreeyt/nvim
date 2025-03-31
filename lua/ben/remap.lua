local utils = require('ben.utils')
vim.g.mapleader = " "

-- Smart way to move between windows
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

vim.keymap.set("n", "<C-Down>", "<C-W>j")
vim.keymap.set("n", "<C-Up>", "<C-W>k")
vim.keymap.set("n", "<C-Left>", "<C-W>h")
vim.keymap.set("n", "<C-Right>", "<C-W>l")

vim.keymap.set('n', '<C-Down>', '<C-W>j')
vim.keymap.set('n', '<C-Up>', '<C-W>k')
vim.keymap.set('n', '<C-Left>', '<C-W>h')
vim.keymap.set('n', '<C-Right>', '<C-W>l')

-- Close the current buffer
vim.keymap.set("n", "<leader>bd", ":Bclose<CR>:tabclose<CR>gT")

-- Close all buffers
vim.keymap.set("n", "<leader>ba", ":bufdo bd<CR>")

-- Navigate buffers
vim.keymap.set("n", "<leader>l", ":bnext<CR>")
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")

-- Useful mappings for managing tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tm", ":tabmove")
vim.keymap.set("n", "<leader>t<leader>", ":tabnext<CR>")

-- Return to the last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line([['"]]) > 1 and vim.fn.line([['"]]) <= vim.fn.line("$") then
            vim.cmd([[normal! g'"]])
        end
    end,
})

-- Toggle paste mode
vim.keymap.set("n", "<leader>pp", ":setlocal paste!<CR>")


local function set_global_keymaps(client, bufnr)
    -- Set LSP-specific buffer options
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.wo.signcolumn = "yes"
    if vim.fn.exists("+tagfunc") == 1 then
        vim.bo.tagfunc = "v:lua.vim.lsp.tagfunc"
    end

    -- Keybindings for LSP functionality
    local opts = { buffer = true }
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
    vim.keymap.set("n", "gS", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.keymap.set("n", "[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.keymap.set("n", "]g", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

    -- Scrolling in hover documentation
    vim.keymap.set("n", "<C-f>", "v:lua.vim.lsp.util.scroll(4)", { expr = true, buffer = true })
    vim.keymap.set("n", "<C-d>", "v:lua.vim.lsp.util.scroll(-4)", { expr = true, buffer = true })

    -- Format document before saving (for specific file types)
    local group_id = vim.api.nvim_create_augroup("LSPFormatOnSave", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.rs", "*.go" },
        callback = function()
            vim.lsp.buf.format({ async = false })
        end,
        group = group_id,
    })
end



vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('global.lsp', { clear = true }),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        set_global_keymaps(client, bufnr)
        -- configure_diagnostics()
    end
})

-- vim.lsp.config('*', {
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
    -- })
