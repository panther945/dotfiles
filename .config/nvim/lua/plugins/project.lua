return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/works/cloud-project/backend/*",
      "~/works/cloud-project/frontend/*",
      "~/works/game-project/backend/*",
      "~/works/game-project/frontend/*",
    },
    picker = {
      type = "fzf-lua", -- or "fzf-lua"
    },
    last_session_on_startup = false,
    dashboard_mode = true,
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- optional picker
    { "ibhagwan/fzf-lua" },
    { "Shatur/neovim-session-manager" },
  },
  keys = {
    { "<leader>fp", "<CMD>NeovimProjectDiscover<CR>", desc = "Find a project" },
  },
  lazy = false,
  priority = 100,
}
