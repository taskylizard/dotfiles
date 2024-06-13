return {
	{
		"overseer.nvim",
		opts = {
			-- Template modules to load
			templates = { "builtin" },
			task_list = {
				bindings = {
					["{"] = "DecreaseWidth",
					["}"] = "IncreaseWidth",
					["["] = "PrevTask",
					["]"] = "NextTask",
				},
			},
		},
		keys = {
			{ "<leader>to", desc = "Task Runner", mode = { "n" } },
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
	},
}
