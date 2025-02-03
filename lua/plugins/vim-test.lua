return {
  'vim-test/vim-test',
  vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>'),
  vim.keymap.set('n', '<leader>tf', ':TestFile<CR>'),
  vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>'),
  vim.keymap.set('n', '<leader>tl', ':TestLast<CR>'),
  vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>'),
  vim.cmd [[
    let test#strategy = "neovim"
    let test#neovim#term_position = "vert"
  ]],
}
