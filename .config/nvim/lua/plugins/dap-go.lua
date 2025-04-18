return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")

    dap.adapters.go = function(callback)
      callback({
        type = "server",
        host = "127.0.0.1",
        port = 19542,
      })
    end
    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
      {
        name = "Debug Go in Docker",
        type = "go",
        request = "attach",
        mode = "remote",
        remotePath = "/work/projects/cloud-project/backend/cloud-micro-game", -- container 裡的程式路徑
        program = "/works/app",
      },
    }
  end,
}
