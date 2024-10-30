return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      html = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      graphql = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      markdown = { { 'prettierd', 'prettier' } },
      yaml = { { 'prettierd', 'prettier' } },
      rust = { 'rustfmt' },
    },
  },
}
