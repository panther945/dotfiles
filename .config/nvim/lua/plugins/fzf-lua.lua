return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>ff", LazyVim.pick("files", { git_icons = false }), desc = "Find Files (Root Dir)" },
    { "<leader>fF", LazyVim.pick("files", { root = false, git_icons = false }), desc = "Find Files (cwd)" },
  },
}
