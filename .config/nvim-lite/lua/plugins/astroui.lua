---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "tokyonight-night",
    highlights = require "plugins.configs.highlights",
    icons = require "plugins.configs.icons",
  },
}
