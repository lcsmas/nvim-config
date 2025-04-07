return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>')
    vim.keymap.set('n', '<leader>tf', ':TestFile<CR>')
    vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>')
    vim.keymap.set('n', '<leader>tl', ':TestLast<CR>')
    vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>')

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'kotlin',
      callback = function()
        -- Kotlin-specific test keymaps
        -- vim.keymap.set('n', '<leader>tn', ':TestNearest --info --console=rich<CR>')
        -- vim.keymap.set('n', '<leader>tf', ':TestFile --info<CR>')
        -- vim.keymap.set('n', '<leader>ts', ':TestSuite --info<CR>')
      end,
    })

    vim.g['test#strategy'] = 'vimux'
  end,
}
