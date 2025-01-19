return {
  "sindrets/diffview.nvim",
  -- event = "LazyFile",
  cmd = { "DiffviewOpen" },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { winbar_info = true },
      file_history = { winbar_info = true },
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
    hooks = {
      diff_buf_read = function(bufnr)
        vim.b[bufnr].view_activated = false
      end,
    },
  },
}
