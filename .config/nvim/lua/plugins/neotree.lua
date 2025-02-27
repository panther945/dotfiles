return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.close_if_last_window = true

    local events = require("neo-tree.events")
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      {
        event = events.FILE_OPENED,
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    })
  end,
}
