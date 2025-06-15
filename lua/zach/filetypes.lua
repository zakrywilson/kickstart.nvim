vim.filetype.add({
  extension = {
    templ = "templ", -- required for vrischmann/tree-sitter-templ
  },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.scm",
  command = "set filetype=scheme",
})
