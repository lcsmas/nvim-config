return {
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
    },
    config = function()
      vim.keymap.set('n', '<leader>od', ':DBUIToggle<CR>', { desc = '[O]pen [D]adbod' })
    end,
  },
}
