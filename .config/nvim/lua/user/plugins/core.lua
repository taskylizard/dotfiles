return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "owo",
      }
      return opts
    end,
  },
  { "mfussenegger/nvim-dap", enabled = false },
}
