return {
  init = function() -- this table overrides highlights in all themes
    local get_hlgroup = require("astroui").get_hlgroup
    return {
      -- remove background of virtual texts
      DiagnosticVirtualTextError = { fg = get_hlgroup("DiagnosticVirtualTextError").fg, bg = "none" },
      DiagnosticVirtualTextHint = { fg = get_hlgroup("DiagnosticVirtualTextHint").fg, bg = "none" },
      DiagnosticVirtualTextInfo = { fg = get_hlgroup("DiagnosticVirtualTextInfo").fg, bg = "none" },
      DiagnosticVirtualTextWarn = { fg = get_hlgroup("DiagnosticVirtualTextWarn").fg, bg = "none" },

      -- remove background of inlay hints
      LspInlayHint = { fg = get_hlgroup("LspInlayHint").fg, bg = "none" },

      -- LSP-related highlights
      -- ["@lsp.type.namespace.python"] = { link = "Identifier" },
    }
  end,
  astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
    -- Normal = { bg = "#000000" },
  },
}
