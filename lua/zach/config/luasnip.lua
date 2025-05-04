local ls = require("luasnip")

-- Load your Lua snippets
require("luasnip.loaders.from_lua").lazy_load({
  paths = { vim.fn.stdpath("config") .. "/lua/zach/snippets" },
})

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})

-- Keymaps (Colemak-optimized)
vim.keymap.set({ "i", "s" }, "<C-n>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-p>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
