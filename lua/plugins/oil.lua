return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  vim.keymap.set('n', '\\', ':Oil<CR>'),
  config = function()
    require('oil').setup {
      lsp_file_methods = { timeout_ms = 10000 },
    }
  end,
}
