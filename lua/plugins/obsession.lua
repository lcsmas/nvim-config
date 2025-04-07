return {
  'tpope/vim-obsession',
  config = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        vim.defer_fn(function()
          if vim.fn.filereadable 'Session.vim' == 1 then
            vim.cmd 'silent! source Session.vim'
          end
        end, 100) -- 100ms delay
      end,
    })
  end,
}
