return {
  "anuvyklack/windows.nvim",
  event = "WinEnter",
  dependencies = "anuvyklack/middleclass",
  opts = {
    animation = { enable = false },
    ignore = {
      buftype = { "quickfix", "help" },
      filetype = { "", "toggleterm" },
    },
  },
}
