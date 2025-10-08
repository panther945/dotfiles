vim.api.nvim_create_autocmd("FileType", {
  command = "set formatoptions-=cro",
})

local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_autocmd("User", {
  pattern = { "SessionLoadPost" },
  group = augroup,
  desc = "Switch to Normal Mode",
  callback = function()
    -- Switch to Normal Mode
    vim.cmd("stopinsert")
  end,
})
