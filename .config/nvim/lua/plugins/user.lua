-- You can also add new plugins here as well using the lazy syntax:
return {
  { "vim-crystal/vim-crystal", ft = { "crystal" } },
  {
    "sourcegraph/sg.nvim",
    lazy = "User Astrofile",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  },
  { "https://github.com/gleam-lang/gleam.vim", ft = { "gleam" } },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    opts = {
      show_numbers = true,
      show_cursorline = true,
    },
  },
}
