return function()
  local get_hlgroup = require("astronvim.utils").get_hlgroup
  local nontext = get_hlgroup "NonText"
  return {
    CursorLineFold = { link = "CursorLineNr" }, -- highlight fold indicator as well as line number
    GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
    HighlightURL = { underline = true }, -- always underline URLs
    ["@variable"] = { fg = "#0eb3d0" },
    ["@keyword.export"] = { fg = "#7dcfff" },
    ["@punctuation.bracket"] = { fg = "#99bbf3" },
    ["@variable.builtin"] = {
      fg = "#f7768e",
    },
  }
end
