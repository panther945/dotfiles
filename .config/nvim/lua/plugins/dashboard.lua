return {
  "folke/snacks.nvim",
  optional = true,
  opts = function(_, opts)
    table.insert(opts.dashboard.preset.keys, 3, {
      action = ":NeovimProjectDiscover",
      desc = "Projects",
      icon = " ",
      key = "p",
    })
  end,
}
