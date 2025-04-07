return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle / [T]est' },
      { '<leader>w', group = '[W]orkspace' },
    }

    require('which-key').add {
      { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
    }
  end,
}
