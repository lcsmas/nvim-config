return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = true,
    }
  end,
}
