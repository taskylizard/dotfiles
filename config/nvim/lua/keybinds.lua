-- --------------------------------------------------------------------------- -
--                                                                             -
--                                                      :::      ::::::::      -
--   keybinds.lua                                     :+:      :+:    :+:      -
--                                                  +:+ +:+         +:+        -
--   By: taskylizard                              +#+  +:+       +#+           -
--                                              +#+#+#+#+#+   +#+              -
--   Created: 2021/12/13 12:04:53 by taskylizard     #+#    #+#                -
--   Updated: 2021/12/13 12:04:53 by taskylizard    ###   ########.fr          -
--                                                                             -
-- --------------------------------------------------------------------------- -

local api = vim.api
local g = vim.g

api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
api.nvim_set_keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
api.nvim_set_keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
api.nvim_set_keymap('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })
api.nvim_set_keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

g["netrw_banner"] = 0
g["netrw_liststyle"] = 3
g["netrw_winsize"] = 25

