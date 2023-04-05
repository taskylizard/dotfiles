return {
  "vuki656/package-info.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  opts = { package_manager = "pnpm" },
  event = "BufRead package.json",
  config = function(_, opts)
    local package = require "package-info"
    package.setup(opts)
    -- Show dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>ns",
      package.show,
      { silent = true, noremap = true, desc = "Show dependency versions" }
    )

    -- Hide dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>nc",
      package.hide,
      { silent = true, noremap = true, desc = "Hide dependency versions" }
    )

    -- Toggle dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>nt",
      package.toggle,
      { silent = true, noremap = true, desc = "Toggle dependency versions" }
    )

    -- Update dependency on the line
    vim.keymap.set(
      { "n" },
      "<LEADER>nu",
      package.update,
      { silent = true, noremap = true, desc = "Update dependency on the line" }
    )

    -- Delete dependency on the line
    vim.keymap.set(
      { "n" },
      "<LEADER>nd",
      package.delete,
      { silent = true, noremap = true, desc = "Delete dependency on the line" }
    )

    -- Install a new dependency
    vim.keymap.set(
      { "n" },
      "<LEADER>ni",
      package.install,
      { silent = true, noremap = true, desc = "Install a new dependency" }
    )

    -- Install a different dependency version
    vim.keymap.set(
      { "n" },
      "<LEADER>np",
      package.change_version,
      { silent = true, noremap = true, desc = "Install a different dependency version" }
    )
  end,
}
