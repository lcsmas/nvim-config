return {
  'simrat39/rust-tools.nvim',
  config = function()
    local rt = require 'rust-tools'

    rt.setup {
      server = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = function(_, bufnr)
          vim.keymap.set('n', '<leader>k', rt.hover_actions.hover_actions, { buffer = bufnr })
          -- vim.keymap.set('n', '<Leader>ca', rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        -- settings = {
        --   ['rust-analyzer'] = {
        --     completion = {
        --       callable = {
        --         snippets = 'none',
        --       },
        --       limit = 10,
        --     },
        --   },
        -- },
      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
    }
  end,
}
