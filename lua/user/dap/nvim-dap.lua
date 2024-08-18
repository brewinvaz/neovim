local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "nvim-telescope/telescope-dap.nvim",
    -- "williamboman/mason.nvim",
    {
      "microsoft/vscode-js-debug",
      opt = true,
      lazy = false,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
    "mxsdev/nvim-dap-vscode-js",
  },
}

local function js_dap_config(dap)
  local js_config = {
    "typescript", -- default
    "javascript", -- default
    "typescriptreact",
    "javascriptreact",
  }

  for _, config in ipairs(js_config) do
    dap.configurations[config] = {
      -- debug single nodejs file
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch File",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
      },
      -- debug node process (add --inspect when you run the process)
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
        sourceMaps = true,
      },
      -- debug client side in Chrome
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch and Debug Chrome",
        url = function()
          local co = coroutine.running()
          return coroutine.create(function()
            vim.ui.input({
              prompt = "URL: ",
              default = "http://localhost:3000",
            }, function(url)
              if url == nil or url == "" then
                return
              else
                coroutine.resume(co, url)
              end
            end)
          end)
        end,
        webRoot = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**/*.js" },
        protocol = "inspector",
        sourceMaps = true,
        userDataDir = false,
      },
      -- divider for launch.json config
      {
        name = "----- :arrow_down: launch.json configs :arrow_down: -----",
        type = "",
        request = "launch",
      },
    }
  end
end

function M.config()
  -- load mason-nvim-dap here, after all adapters have been setup
  local dap, ui = require "dap", require "dapui"

  dap.listeners.before.attach.dapui_config = function()
    ui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    ui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
  end

  require("dap-vscode-js").setup {
    debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  }

  js_dap_config(dap)

  local wk = require "which-key"

  wk.add {
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<CR>", desc = "Step Back" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<CR>", desc = "Run To Cursor" },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<CR>", desc = "Disconnect" },
    { "<leader>dg", "<cmd>lua require'dap'.session()<CR>", desc = "Get Session" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over" },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step Out" },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<CR>", desc = "Pause" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", desc = "Toggle Repl" },
    { "<leader>ds", "<cmd>lua require'dap'.continue()<CR>", desc = "Start" },
    { "<leader>dq", "<cmd>lua require'dap'.close()<CR>", desc = "Quit" },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle({ reset = true })<CR>", desc = "Toggle UI" },
    { "<leader>d?", "<cmd>lua require'dapui'.eval(nil, { enter = true })<CR>", desc = "Eval" },
  }
end

return M
