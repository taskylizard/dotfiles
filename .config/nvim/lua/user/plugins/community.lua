return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  {
    "overseer.nvim", 
      keys = {
        { "<leader>to", desc = "Task Runner", mode = {"n"}},
        { "<leader>toR", "<cmd>OverseerRunCmd<cr>", desc = "Run Command" },
        { "<leader>toa", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
        { "<leader>tob", "<cmd>OverseerBuild<cr>", desc = "Build" },
        { "<leader>toc", "<cmd>OverseerClose<cr>", desc = "Close" },
        { "<leader>tod", "<cmd>OverseerDeleteBundle<cr>", desc = "Delete Bundle" },
        { "<leader>tol", "<cmd>OverseerLoadBundle<cr>", desc = "Load Bundle" },
        { "<leader>too", "<cmd>OverseerOpen<cr>", desc = "Open" },
        { "<leader>toq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
        { "<leader>tor", "<cmd>OverseerRun<cr>", desc = "Run" },
        { "<leader>tos", "<cmd>OverseerSaveBundle<cr>", desc = "Save Bundle" },
        { "<leader>tot", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
      },
  }
}
