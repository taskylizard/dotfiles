return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "p00f/nvim-ts-rainbow", event = "VeryLazy" },
  },
  opts = {
    rainbow = {
      enable = true,
      disable = { "html" },
      extended_mode = false,
      max_file_lines = nil,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,       persist_queries = false,       keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
  },
}
