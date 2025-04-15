local cwd = function()
  local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  return (vim.o.columns > 85 and dir_name) or ""
end

local colors = {
  white = "#D9E0EE",
  grey = "#474656",
  lightbg = "#2f2e3e",
  green = "#ABE9B3",
  red = "#F38BA8",
  black = "#1E1D2D",
}

local icons = LazyVim.config.icons

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = "|",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          icon = { " ", align = "left" },
          padding = { left = 1, right = 0 },
          color = { gui = "bold" },
        },
        {
          function()
            return ""
          end,
          draw_empty = true,
          color = { fg = colors.grey, bg = colors.grey },
          separator = { left = "", right = "" },
        },
      },
      lualine_b = {
        {
          "branch",
          color = { fg = colors.white, bg = colors.lightbg },
          separator = { right = "" },
        },
      },
      lualine_c = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path() },
      },
      lualine_y = {
        {
          function()
            return "󰉋 "
          end,
          padding = 0,
          color = { fg = colors.black, bg = colors.red },
        },
        {
          cwd,
          color = { fg = colors.white, bg = colors.lightbg },
        },
      },
      lualine_z = {
        {
          function()
            return " "
          end,
          padding = 0,
          color = { fg = colors.black, bg = colors.green },
        },
        {
          "location",
          color = { fg = colors.green, bg = colors.lightbg },
        },
      },
    },
  },
}
