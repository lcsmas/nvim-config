return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    -- Function to load environment variables from .env file
    local function load_env(file)
      local env_vars = {}
      local cwd = vim.fn.getcwd()
      local env_file_path = cwd .. '/' .. file

      local env_file, err = io.open(file, 'r')
      if env_file then
        for line in env_file:lines() do
          for k, v in string.gmatch(line, '([%w_]+)=([^\n]+)') do
            env_vars[k] = v
          end
        end
        env_file:close()
      else
        print('Current working directory: ' .. cwd) -- Debug print
        print('Looking for .env file at: ' .. env_file_path) -- Debug print
        print 'Could not open .env file' -- Debug print
        print('Error message: ' .. err)
      end
      return env_vars
    end

    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'yarn test --',
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    }

    local run = require('neotest').run
    local output = require('neotest').output
    local output_panel = require('neotest').output_panel
    local watch = require('neotest').watch
    local summary = require('neotest').summary

    vim.keymap.set('n', '<leader>tn', run.run, {
      desc = '[T]est [N]earest',
    })

    vim.keymap.set('n', '<leader>tf', function()
      run.run(vim.fn.expand '%')
    end, {
      desc = '[T]est [F]ile',
    })

    vim.keymap.set('n', '<leader>to', function()
      output.open { enter = true }
    end, { desc = '[T]est [O]pen results' })

    vim.keymap.set('n', '<leader>tp', function()
      output_panel.toggle()
    end, { desc = '[T]est [P]anel toggle' })

    vim.keymap.set('n', '<leader>ts', function()
      summary.toggle()
    end, { desc = '[T]est [S]ummary toggle' })

    vim.keymap.set('n', '<leader>tw', function()
      watch.toggle(vim.fn.expand '%')
    end, { desc = '[T]est [W]atch file toggle' })

    vim.keymap.set('n', '<leader>td', function()
      run.run { strategy = 'dap' }
    end, { desc = '[T]est [D]ebug' })
  end,
}
