local conf = xplr.config.general

conf.show_hidden = false
conf.general.read_only = false
conf.enable_recover_mode = false
conf.start_fifo = nil
conf.hide_remaps_in_help_menu = false

------ Prompt
conf.prompt.format = "λ "
conf.prompt.style.add_modifiers = nil
conf.prompt.style.sub_modifiers = nil
conf.prompt.style.bg = nil
conf.prompt.style.fg = nil

------ Initial layout
conf.initial_layout = "default"

------ Initial mode
conf.initial_mode = "default"

------ Initial sorting
conf.initial_sorting = {
  { sorter = "ByCanonicalIsDir", reverse = true },
  { sorter = "ByIRelativePath", reverse = false },
}

------ Logs
-------- Error
conf.logs.error.format = "ERROR"
conf.logs.error.style.add_modifiers = nil
conf.logs.error.style.sub_modifiers = nil
conf.logs.error.style.bg = nil
conf.logs.error.style.fg = "Red"

-------- Info
conf.logs.info.format = "INFO"
conf.logs.info.style.add_modifiers = nil
conf.logs.info.style.sub_modifiers = nil
conf.logs.info.style.bg = nil
conf.logs.info.style.fg = "LightBlue"

-------- Success
conf.logs.success.format = "SUCCESS"
conf.logs.success.style.add_modifiers = nil
conf.logs.success.style.bg = nil
conf.logs.success.style.fg = "Green"
conf.logs.success.style.sub_modifiers = nil

-------- Warning
conf.logs.warning.format = "WARNING"
conf.logs.warning.style.add_modifiers = nil
conf.logs.warning.style.bg = nil
conf.logs.warning.style.fg = "Yellow"
conf.logs.warning.style.sub_modifiers = nil

------ Default UI
conf.default_ui.prefix = "  "
conf.default_ui.suffix = ""
conf.default_ui.style.add_modifiers = nil
conf.default_ui.style.sub_modifiers = nil
conf.default_ui.style.bg = nil
conf.default_ui.style.fg = nil

------ Focus UI
conf.focus_ui.prefix = "▸["
conf.focus_ui.suffix = "]"
conf.focus_ui.style.add_modifiers = { "Bold" }
conf.focus_ui.style.sub_modifiers = nil
conf.focus_ui.style.bg = nil
conf.focus_ui.style.fg = "Blue"

------ Selection UI
conf.selection_ui.prefix = " {"
conf.selection_ui.suffix = "}"
conf.selection_ui.style.add_modifiers = { "Bold" }
conf.selection_ui.style.sub_modifiers = nil
conf.selection_ui.style.bg = nil
conf.selection_ui.style.fg = "LightGreen"

------ Focus UI
conf.focus_selection_ui.prefix = "▸["
conf.focus_selection_ui.suffix = "]"
conf.focus_selection_ui.style.add_modifiers = { "Bold" }
conf.focus_selection_ui.style.sub_modifiers = nil
conf.focus_selection_ui.style.bg = nil
conf.focus_selection_ui.style.fg = "LightGreen"

------ Sort & filter UI
-------- Separator
conf.sort_and_filter_ui.separator.format = " › "
conf.sort_and_filter_ui.separator.style.add_modifiers = { "Dim" }
conf.sort_and_filter_ui.separator.style.bg = nil
conf.sort_and_filter_ui.separator.style.fg = nil
conf.sort_and_filter_ui.separator.style.sub_modifiers = nil

-------- Default identidier
conf.sort_and_filter_ui.default_identifier.format = nil
conf.sort_and_filter_ui.default_identifier.style.add_modifiers =
  {
    "Bold",
  }
conf.sort_and_filter_ui.default_identifier.style.bg = nil
conf.sort_and_filter_ui.default_identifier.style.fg = nil
conf.sort_and_filter_ui.default_identifier.style.sub_modifiers =
  nil

-------- Filter identifiers
conf.sort_and_filter_ui.filter_identifiers = {
  AbsolutePathDoesContain = {
    format = "abs=~",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  AbsolutePathDoesEndWith = {
    format = "abs=$",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  AbsolutePathDoesNotContain = {
    format = "abs!~",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  AbsolutePathDoesNotEndWith = {
    format = "abs!$",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  AbsolutePathDoesNotStartWith = {
    format = "abs!^",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  AbsolutePathDoesStartWith = {
    format = "abs=^",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  AbsolutePathIs = {
    format = "abs==",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  AbsolutePathIsNot = {
    format = "abs!=",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IAbsolutePathDoesContain = {
    format = "[i]abs=~",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IAbsolutePathDoesEndWith = {
    format = "[i]abs=$",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IAbsolutePathDoesNotContain = {
    format = "[i]abs!~",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IAbsolutePathDoesNotEndWith = {
    format = "[i]abs!$",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IAbsolutePathDoesNotStartWith = {
    format = "[i]abs!^",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IAbsolutePathDoesStartWith = {
    format = "[i]abs=^",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IAbsolutePathIs = {
    format = "[i]abs==",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IAbsolutePathIsNot = {
    format = "[i]abs!=",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IRelativePathDoesContain = {
    format = "[i]rel=~",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IRelativePathDoesEndWith = {
    format = "[i]rel=$",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IRelativePathDoesNotContain = {
    format = "[i]rel!~",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IRelativePathDoesNotEndWith = {
    format = "[i]rel!$",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IRelativePathDoesNotStartWith = {
    format = "[i]rel!^",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IRelativePathDoesStartWith = {
    format = "[i]rel=^",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IRelativePathIs = {
    format = "[i]rel==",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  IRelativePathIsNot = {
    format = "[i]rel!=",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  RelativePathDoesContain = {
    format = "rel=~",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  RelativePathDoesEndWith = {
    format = "rel=$",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  RelativePathDoesNotContain = {
    format = "rel!~",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  RelativePathDoesNotEndWith = {
    format = "rel!$",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  RelativePathDoesNotStartWith = {
    format = "rel!^",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  RelativePathDoesStartWith = {
    format = "rel=^",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  RelativePathIs = {
    format = "rel==",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  RelativePathIsNot = {
    format = "rel!=",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
}

-------- Sort direction identifiers
conf.sort_and_filter_ui.sort_direction_identifiers.forward.format =
  "↓"
conf.sort_and_filter_ui.sort_direction_identifiers.forward.style.add_modifiers =
  nil
conf.sort_and_filter_ui.sort_direction_identifiers.forward.style.bg =
  nil
conf.sort_and_filter_ui.sort_direction_identifiers.forward.style.fg =
  nil
conf.sort_and_filter_ui.sort_direction_identifiers.forward.style.sub_modifiers =
  nil
conf.sort_and_filter_ui.sort_direction_identifiers.reverse.format =
  "↑"
conf.sort_and_filter_ui.sort_direction_identifiers.reverse.style.add_modifiers =
  nil
conf.sort_and_filter_ui.sort_direction_identifiers.reverse.style.bg =
  nil
conf.sort_and_filter_ui.sort_direction_identifiers.reverse.style.fg =
  nil
conf.sort_and_filter_ui.sort_direction_identifiers.reverse.style.sub_modifiers =
  nil

-------- Sorter identifiers
conf.sort_and_filter_ui.sorter_identifiers = {
  ByCanonicalAbsolutePath = {
    format = "[c]abs",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByCanonicalExtension = {
    format = "[c]ext",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByCanonicalIsDir = {
    format = "[c]dir",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByCanonicalIsFile = {
    format = "[c]file",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByCanonicalIsReadonly = {
    format = "[c]ro",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByCanonicalMimeEssence = {
    format = "[c]mime",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByCanonicalSize = {
    format = "[c]size",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByExtension = {
    format = "ext",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByICanonicalAbsolutePath = {
    format = "[ci]abs",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByIRelativePath = {
    format = "[i]rel",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByISymlinkAbsolutePath = {
    format = "[si]abs",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByIsBroken = {
    format = "⨯",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByIsDir = {
    format = "dir",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByIsFile = {
    format = "file",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByIsReadonly = {
    format = "ro",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByIsSymlink = {
    format = "sym",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByMimeEssence = {
    format = "mime",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  ByRelativePath = {
    format = "rel",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  BySize = {
    format = "size",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  BySymlinkAbsolutePath = {
    format = "[s]abs",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  BySymlinkExtension = {
    format = "[s]ext",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  BySymlinkIsDir = {
    format = "[s]dir",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  BySymlinkIsFile = {
    format = "[s]file",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  BySymlinkIsReadonly = {
    format = "[s]ro",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  BySymlinkMimeEssence = {
    format = "[s]mime",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  BySymlinkSize = {
    format = "[s]size",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
}

------ Panel UI
-------- Default
conf.panel_ui.default.borders = {
  "Top",
  "Right",
  "Bottom",
  "Left",
}
conf.panel_ui.default.style.add_modifiers = nil
conf.panel_ui.default.style.bg = nil
conf.panel_ui.default.style.fg = nil
conf.panel_ui.default.style.sub_modifiers = nil
conf.panel_ui.default.title.format = nil
conf.panel_ui.default.title.style.add_modifiers = nil
conf.panel_ui.default.title.style.bg = nil
conf.panel_ui.default.title.style.fg = nil
conf.panel_ui.default.title.style.sub_modifiers = nil

-------- Help menu
conf.panel_ui.help_menu.borders = nil
conf.panel_ui.help_menu.style.add_modifiers = nil
conf.panel_ui.help_menu.style.bg = nil
conf.panel_ui.help_menu.style.fg = nil
conf.panel_ui.help_menu.style.sub_modifiers = nil
conf.panel_ui.help_menu.title.format = nil
conf.panel_ui.help_menu.title.style.add_modifiers = nil
conf.panel_ui.help_menu.title.style.bg = nil
conf.panel_ui.help_menu.title.style.fg = nil
conf.panel_ui.help_menu.title.style.sub_modifiers = nil

-------- Input & log
conf.panel_ui.input_and_logs.borders = nil
conf.panel_ui.input_and_logs.style.add_modifiers = nil
conf.panel_ui.input_and_logs.style.bg = nil
conf.panel_ui.input_and_logs.style.fg = nil
conf.panel_ui.input_and_logs.style.sub_modifiers = nil
conf.panel_ui.input_and_logs.title.format = nil
conf.panel_ui.input_and_logs.title.style.add_modifiers = nil
conf.panel_ui.input_and_logs.title.style.bg = nil
conf.panel_ui.input_and_logs.title.style.fg = nil
conf.panel_ui.input_and_logs.title.style.sub_modifiers = nil

-------- Selection
conf.panel_ui.selection.borders = nil
conf.panel_ui.selection.style.add_modifiers = nil
conf.panel_ui.selection.style.bg = nil
conf.panel_ui.selection.style.fg = nil
conf.panel_ui.selection.style.sub_modifiers = nil
conf.panel_ui.selection.title.format = nil
conf.panel_ui.selection.title.style.add_modifiers = nil
conf.panel_ui.selection.title.style.bg = nil
conf.panel_ui.selection.title.style.fg = nil
conf.panel_ui.selection.title.style.sub_modifiers = nil

-------- Sort and filter
conf.panel_ui.sort_and_filter.borders = nil
conf.panel_ui.sort_and_filter.style.add_modifiers = nil
conf.panel_ui.sort_and_filter.style.bg = nil
conf.panel_ui.sort_and_filter.style.fg = nil
conf.panel_ui.sort_and_filter.style.sub_modifiers = nil
conf.panel_ui.sort_and_filter.title.format = nil
conf.panel_ui.sort_and_filter.title.style.add_modifiers = nil
conf.panel_ui.sort_and_filter.title.style.bg = nil
conf.panel_ui.sort_and_filter.title.style.fg = nil
conf.panel_ui.sort_and_filter.title.style.sub_modifiers = nil

-------- Table
conf.panel_ui.table.borders = nil
conf.panel_ui.table.style.add_modifiers = nil
conf.panel_ui.table.style.bg = nil
conf.panel_ui.table.style.fg = nil
conf.panel_ui.table.style.sub_modifiers = nil
conf.panel_ui.table.title.format = nil
conf.panel_ui.table.title.style.add_modifiers = nil
conf.panel_ui.table.title.style.bg = nil
conf.panel_ui.table.title.style.fg = nil
conf.panel_ui.table.title.style.sub_modifiers = nil

------ Table
conf.table.style.add_modifiers = nil
conf.table.style.bg = nil
conf.table.style.fg = nil
conf.table.style.sub_modifiers = nil

-------- Col spacing
conf.table.col_spacing = 1

-------- Col widths
conf.table.col_widths = {
  { Percentage = 10 },
  { Percentage = 50 },
  { Percentage = 10 },
  { Percentage = 10 },
  { Percentage = 20 },
}

-------- Header
conf.table.header.cols = {
  {
    format = " index",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "╭──── path",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "permissions",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "size",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "type",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
}
conf.table.header.height = 1
conf.table.header.style.add_modifiers = { "Bold" }
conf.table.header.style.sub_modifiers = nil
conf.table.header.style.bg = nil
conf.table.header.style.fg = nil

-------- Row
conf.table.row.cols = {
  {
    format = "builtin.fmt_general_table_row_cols_0",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "builtin.fmt_general_table_row_cols_1",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "builtin.fmt_general_table_row_cols_2",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "builtin.fmt_general_table_row_cols_3",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "builtin.fmt_general_table_row_cols_4",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
}
conf.table.row.height = 0
conf.table.row.style.add_modifiers = nil
conf.table.row.style.bg = nil
conf.table.row.style.fg = nil
conf.table.row.style.sub_modifiers = nil

-------- Tree
conf.table.tree = {
  {
    format = "├─",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "├─",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
  {
    format = "╰─",
    style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil },
  },
}

