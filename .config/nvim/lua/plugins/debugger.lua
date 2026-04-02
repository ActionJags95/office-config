local js_based_languages = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "vue",
}
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "igorlfs/nvim-dap-view",
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
    "jay-babu/mason-nvim-dap.nvim",
    "mason-org/mason.nvim",
    "nvim-neotest/neotest",
    "nvim-neotest/nvim-nio",
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      config = function()
        -- @diagnostic disable-next-line: missing fields
        require("dap-vscode-js").setup({
          debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

          adapters = {
            "chrome",
            "pwa-node",
            "pwa-chrome",
            "pwa-msedge",
            "pwa-extensionHost",
            "node-terminal",
            "node",
          },
        })
      end,
    },
    {
      "Joakker/lua-json5",
      build = "./install.sh",
    },
  },
  keys = {
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Dap Continue",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dsi",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<leader>dsO",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>dso",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<leader>da",
      function()
        if vim.fn.filereadable(".vscode/launch.json") then
          local dap_vscode = require("dap.ext.vscode")
          dap_vscode.load_launchjs(nil, {
            ["pwa-node"] = js_based_languages,
            ["node"] = js_based_languages,
            ["chrome"] = js_based_languages,
            ["pwa-chrome"] = js_based_languages,
          })
        end
      end,
      desc = "Run with args",
    },
  },
  config = function()
    local dap = require("dap")

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "8123",
      executable = {
        command = "js-debug-adapter",
      },
    }
    for _, langauge in ipairs(js_based_languages) do
      dap.configurations[langauge] = {
        -- Debug single NodeJS file
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },

        -- Debug NodeJS processes (make sure to add --inspect when you run the process)
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },

        -- Debug web applications (client side)
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch & Debug chrome",
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = "Enter URL: ",
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
          skipFiles = { "<node_internals>/**/*/.js" },
          protocol = "inspector",
          sourceMaps = true,
          userDataDir = false,
        },

        -- Divider for the launch.json derived configs
        {
          name = "-----  launch.json configs  -----",
          type = "",
          request = "launch",
        },
      }
    end

    local dap_ui = require("dapui")
    dap_ui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dap_ui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dap_ui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dap_ui.close()
    end

    vim.fn.sign_define(
      "DapBreakpoint",
      { text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
  end,
}
