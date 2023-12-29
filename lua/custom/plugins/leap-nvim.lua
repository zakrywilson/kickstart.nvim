-- leap-nvim.lua
-- (https://github.com/ggandor/leap.nvim?tab=readme-ov-file)
return {
  "ggandor/leap.nvim",
  config = function()
    require("leap").add_default_mappings()
    local leap = require('leap')
    leap.opts.safe_labels = 'stnuf'
    leap.opts.labels = 'neioumhtsrafvdjkqgzbNEIOUMHTSRAFVDJ;K/QGZB'
  end,
}
