return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    lazy = false,
    enabled = false,
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<M-o>',
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
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
