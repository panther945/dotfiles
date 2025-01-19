return {
  "stevearc/oil.nvim",
  opts = {
    skip_confirm_for_simple_edits = true,
  },
  -- Optional dependencies
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
}
