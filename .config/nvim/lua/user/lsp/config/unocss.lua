return {
  on_attach = function(client, bufnr) client.server_capabilities.documentHighlightProvider = false end,
  filetypes = {
    "astro",
    "html",
    "typescriptreact",
  },
}
