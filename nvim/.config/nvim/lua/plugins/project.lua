return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/works/cloud/cloud-project/*",
      "~/works/game/game-project/backend/*",
      "~/works/game/game-project/frontend/*",
    },
    picker = {
      type = "fzf-lua", -- or "fzf-lua"
    },
    -- dashboard_mode = true,
    last_session_on_startup = false,
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "Shatur/neovim-session-manager" },
    { "ibhagwan/fzf-lua" },
  },
  keys = {
    { "<leader>fp", "<CMD>NeovimProjectDiscover<CR>", desc = "Find a project" },
    { "<leader>fh", "<CMD>NeovimProjectHistory<CR>", desc = "Find a project from history" },
  },
  lazy = false,
  priority = 100,
}
