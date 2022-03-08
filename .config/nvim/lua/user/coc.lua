local cmd = vim.cmd     				-- execute Vim commands
local map = vim.api.nvim_set_keymap	-- map keys


map("x", "<leader>z", "<Plug>(coc-format-selected)", {})
map("n", "<leader>z", "<Plug>(coc-format-selected)", {})

map("x", "<leader>zf", "<Plug>(coc-definition)", {})
map("n", "<leader>zf", "<Plug>(coc-definition)", {})

map("x", "<leader>zt", "<Plug>(coc-type-definition)", {})
map("n", "<leader>zt", "<Plug>(coc-type-definition)", {})

map("x", "<leader>zi", "<Plug>(coc-implementation)", {})
map("n", "<leader>zi", "<Plug>(coc-implementation)", {})

map("x", "<leader>zr", "<Plug>(coc-references)", {})
map("n", "<leader>zr", "<Plug>(coc-references)", {})

