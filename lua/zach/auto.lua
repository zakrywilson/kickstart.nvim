-- source: https://templ.guide/commands-and-tools/ide-support#formatting
local templ_format = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
        on_exit = function()
            -- Reload the buffer only if it's still the current buffer
            if vim.api.nvim_get_current_buf() == bufnr then
                vim.cmd('e!')
            end
        end,
    })
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = templ_format })

-- Clojure + Conjure keymappings
-- Key mapping for Conjure evaluation, specific to Clojure files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "clojure",
    callback = function()
        vim.keymap.set("n", "<leader>ce", "<cmd>ConjureEval<cr>",
            { desc = "Evaluate Clojure with Conjure", buffer = true })
        vim.keymap.set("v", "<leader>ce", ":ConjureEval<cr>", { desc = "Evaluate selection with Conjure", buffer = true })
        vim.keymap.set("n", "<leader>cef", "<cmd>ConjureEvalFile<cr>",
            { desc = "Evaluate Clojure File with Conjure", buffer = true })
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.cmd([[
          highlight Comment cterm=italic gui=italic
          highlight Normal guibg=none
          highlight NonText guibg=none
          highlight Normal ctermbg=none
          highlight NonText ctermbg=none
        ]])
    end,
})
