-- --------------------------------------------------------------------------- -
--                                                                             -
--                                                      :::      ::::::::      -
--   zen.lua                                          :+:      :+:    :+:      -
--                                                  +:+ +:+         +:+        -
--   By: taskylizard                              +#+  +:+       +#+           -
--                                              +#+#+#+#+#+   +#+              -
--   Created: 2021/12/13 12:11:39 by taskylizard     #+#    #+#                -
--   Updated: 2021/12/13 12:11:39 by taskylizard    ###   ########.fr          -
--                                                                             -
-- --------------------------------------------------------------------------- -

local colors = {

	flavour = "dark", -- set type of colorscheme: dark/light
	bg = "#16181D", -- background
	bg_alt = "#16181D", -- alternate background
	bg_float = "#FF1C1F26", -- for floating windows and statuslines and pum sidebar and pum selected and CursorColumn
	inactive = "#2b303b", -- for stuff like empty folder(any inactive stuff)
	subtle = "#2b303b", -- for comments and float border and more...
	fg = "#d8dee9", -- the foreground/text color
	red = "#bf616a", -- for errors
	yellow = "#ebcb8b", -- for warns
	orange = "#d08770", -- mostly for booleans
	blue = "#88c0d0", -- for keywords
	green = "#a3be8c", -- for info and constructors/labels and diffadd
	magenta = "#b48ead", -- for hints and visual mode/search foreground/special comments/git stage and merge
	highlight = "#3b4252", -- ofc for highlighting (it is the bg of highlighted text)
	highlight_inactive = "#4c566a", -- same as highlight for inactive stuff and also cursor line
	highlight_overlay = "#4c566a", -- same as highlight for overlays (floats)
	none = "NONE",
	variable = "#8fbcbb",
	subtle = "#616E88", -- for float border and more...
}

return colors

