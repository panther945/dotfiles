return {
  {

    "coffebar/neovim-project",
    opts = {
      picker = {
        type = "snacks", -- one of "telescope", "fzf-lua", or "snacks"
      },
      dashboard_mode = true,
      last_session_on_startup = false,
    },
    -- init = function()
    --   -- enable saving the state of plugins in the session
    --   vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    -- end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- optional picker
      -- { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      -- optional picker
      -- { "ibhagwan/fzf-lua" },
      -- optional picker
      { "folke/snacks.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    keys = {
      { "<leader>fp", "<CMD>NeovimProjectDiscover<CR>", desc = "Find a project" },
    },
    lazy = false,
    priority = 100,
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      table.remove(opts.dashboard.preset.keys, 3)
      table.insert(opts.dashboard.preset.keys, 3, {
        icon = " ",
        key = "p",
        desc = "Projects",
        action = "<CMD>NeovimProjectDiscover<CR>",
      })
    end,
  },
}
