return {
  "j-hui/fidget.nvim",
  event = "BufReadPre",
  opts = {
    fmt = {
      task = function(task_name, message, percentage)
        if #message > 42 then message = string.format("%.39s...", message) end
        if #task_name > 42 then task_name = string.format("%.39s...", task_name) end
        return string.format("%s%s [%s]", message, percentage and string.format(" (%s%%)", percentage) or "", task_name)
      end,
    },
  },
}
