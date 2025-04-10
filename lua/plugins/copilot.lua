return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    lazy = false,
    config = function()
      require('copilot').setup {
        suggestion = { auto_trigger = true },
        panel = { enabled = false },
        copilot_node_command = '/home/lmas/.nvm/versions/node/v20.19.0/bin/node',
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
