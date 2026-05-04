local dap = require("dap")
local dapui = require("dapui")

-- Setup DAP UI and virtual text
require("nvim-dap-virtual-text").setup()
dapui.setup()

-- Python adapter configuration
dap.adapters.python = {
  type = 'executable';
  command = vim.fn.exepath('python');
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.java = {
  {
    type = 'java';
    request = 'launch';
    name = "Launch Current File";
    mainClass = function()
      return vim.fn.input('Main Class > ', vim.fn.getcwd() .. '.', 'file')
    end;
    projectName = function()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    end;
    args = function()
      local input = vim.fn.input('Program arguments: ')
      return vim.split(input, " +")
    end;
  },
}
dap.configurations.python = {
  -- 1. Launch main.py from root (this will be shown first)
  {
    type = 'python';
    request = 'launch';
    name = '🟢 Run main.py (project root)';
    program = function()
      local workspace = vim.lsp.buf.list_workspace_folders()[1]
      return (workspace or vim.fn.getcwd()) .. '/main.py'
    end;
    console = 'integratedTerminal';
    pythonPath = function()
      return vim.fn.exepath('python')
    end;
  },

  -- 2. Launch currently open file
  {
    type = 'python';
    request = 'launch';
    name = '📄 Run Current File';
    program = "${file}";
    console = 'integratedTerminal';
    pythonPath = function()
      return vim.fn.exepath('python')
    end;
  },

{
  type = 'python';
  request = 'launch';
  name = '🧪 Run Tests (unittest via debugpy)';
  module = 'unittest';
  args = function()
    local file = vim.fn.expand('%:p')
    -- Run current test file if you're in one
    if file:match('test_.*%.py$') or file:match('.*/tests?/.*%.py$') then
      return { file }
    else
      -- Otherwise run discovery in tests/ folder
      return { 'discover', '-s', 'tests' }
    end
  end;
  console = 'integratedTerminal';
  justMyCode = false;
  pythonPath = function()
    return vim.fn.exepath('python')
  end;
},
}
-- DAP UI auto open
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end


-- Keymappings
map("n", "<leader>df", function() require("dap").continue() end, { desc = "Debug: Start/Continue" })

-- Set breakpoint
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })

-- Step over
map("n", "<leader>dv", function() require("dap").step_over() end, { desc = "Debug: Step Over" })

-- Step into
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Debug: Step Into" })

-- Step out
map("n", "<leader>do", function() require("dap").step_out() end, { desc = "Debug: Step Out" })

-- Open debugging sidebar
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Debug: Toggle UI" })

-- Terminate debug session
map("n", "<leader>dx", function() require("dap").terminate() end, { desc = "Debug: Terminate" })

-- Conditional breakpoint
map("n", "<leader>dc", function()
  vim.ui.input({ prompt = "Condition: " }, function(condition)
    if condition then
      require("dap").set_breakpoint(condition)
    end
  end)
end, { desc = "Debug: Conditional Breakpoint" })

-- Log point
map("n", "<leader>dl", function()
  vim.ui.input({ prompt = "Log message: " }, function(message)
    if message then
      require("dap").set_breakpoint(nil, nil, message)
    end
  end)
end, { desc = "Debug: Log Point" })

