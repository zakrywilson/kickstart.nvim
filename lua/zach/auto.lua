local templ_format = function()
  local filename = vim.api.nvim_buf_get_name(0)

  vim.fn.jobstart({ "templ", "fmt", filename }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stderr = function(_, data)
      if data and #data > 0 then
        local msg = table.concat(data, "\n")
        -- Only show real errors
        if not msg:match("errors=0") then
          vim.notify("templ fmt error:\n" .. msg, vim.log.levels.ERROR)
        end
      end
    end,
    on_exit = function(_, code)
      if code == 0 then
        vim.cmd("checktime")
      else
        vim.notify("templ fmt failed for " .. filename, vim.log.levels.ERROR)
      end
    end,
  })
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.templ",
  callback = templ_format,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "<leader>ci", "<cmd>GoImports<cr>", { desc = "Run GoImports", buffer = true })
    vim.keymap.set("n", "<leader>ce", "<cmd>GoIfErr<cr>", { desc = "Run GoIfErr", buffer = true })
    vim.keymap.set("n", "<leader>cf", "<cmd>GoFmt<cr>", { desc = "Run GoFmt", buffer = true })
  end,
})

-- Clojure + Conjure keymappings
-- Key mapping for Conjure evaluation, specific to Clojure files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "clojure", "janet" },
  callback = function()
    vim.keymap.set("n", "<leader>cc", "<cmd>ConjureConnect<cr>", { desc = "Connect to Conjure", buffer = true })
    vim.keymap.set(
      "n",
      "<leader>clsx",
      "<cmd>ConjureLogSplit<cr>",
      { desc = "Open Conjure Log (split)", buffer = true }
    )
    vim.keymap.set(
      "n",
      "<leader>clsv",
      "<cmd>ConjureLogVSplit<cr>",
      { desc = "Open Conjure Log (vertical split)", buffer = true }
    )
    vim.keymap.set("n", "<leader>ce", "<cmd>ConjureEval<cr>", { desc = "Evaluate Clojure with Conjure", buffer = true })
    vim.keymap.set(
      "v",
      "<leader>ce",
      ":ConjureEvalVisual<cr>",
      { desc = "Evaluate selection with Conjure", buffer = true }
    )
    vim.keymap.set(
      "n",
      "<leader>cef",
      "<cmd>ConjureEvalFile<cr>",
      { desc = "Evaluate Clojure File with Conjure", buffer = true }
    )
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

-- Create an autocommand for Markdown
-- where <leader>md creates an H3 header with the date.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local function insert_markdown_header_with_date()
      -- E.g., "Wed, Mar 15, 2023"
      local today = os.date("%a, %b %d, %Y")
      local header = "### " .. today

      -- Get the current cursor position (row is 0-indexed in Lua API)
      local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
      row = row - 1

      -- Insert the header and an empty line below at the current line
      vim.api.nvim_buf_set_lines(0, row, row, false, { header, "" })

      -- Move the cursor to the new empty line (adjusting back to 1-indexed)
      vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
    end

    vim.keymap.set(
      "n",
      "<leader>md",
      insert_markdown_header_with_date,
      { desc = "Insert H3 [D]ate", buffer = true, silent = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Checklists in markdown files
    vim.keymap.set(
      "n",
      "<Leader>mc",
      "<Cmd>ChecklistsTelescope<CR>",
      { noremap = true, silent = true, desc = "Find [C]hecklists" }
    )

    -- Markdown checklist toggling
    local function toggle()
      vim.go.operatorfunc = "v:lua.require'markdown-togglecheck'.toggle"
      return "g@l"
    end

    vim.keymap.set("n", "<leader>mtc", toggle, { expr = true, desc = "[T]oggle [C]heckbox" })

    vim.keymap.set("n", "<leader>mtm", function()
      require("render-markdown").toggle()
    end, { desc = "[T]oggle [M]arkdown Rendering" })
  end,
})
