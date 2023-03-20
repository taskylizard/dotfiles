local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- FIXME: jank
local lspconfig = require "lspconfig"
local custom_handler = function(err, method, result, client_id, bufnr, config)
  if err then
    -- handle the error
  elseif result == nil or vim.tbl_isempty(result) then
    -- handle no results
  else
    -- handle results
  end
end

return {
  capabilities = {
    textDocument = {
      documentHighlight = {
        dynamicRegistration = false,
        linkSupport = false,
      },
    },
  },
  handlers = {
    ["textDocument/documentHighlight"] = custom_handler,
  },
  -- add conditional statement to check if server supports method
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_highlight then
      -- enable highlight on cursor hold
      vim.api.nvim_command "autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()"
      vim.api.nvim_command "autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()"
      -- enable highlight on cursor move
      vim.api.nvim_command "autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()"
    end
  end,
  -- on_attach = function(client, bufnr) client.server_capabilities.documentHighlightProvider = false end,
  -- capabilities = capabilities,
  filetypes = {
    "astro",
    "html",
    "typescriptreact",
  },
  on_new_config = function(new_config) end,
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern("unocss.config.js", "unocss.config.ts")(fname)
  end,
}
