return {
  'hrsh7th/nvim-cmp',
  -- event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'kristijanhusak/vim-dadbod-completion',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},

        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'copilot' },
      },

      window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },

      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            buffer = '[Buffer]',
            path = '[Path]',
            ['vim-dadbod-completion'] = '[DB]',
            luasnip = '[LuaSnip]',
            copilot = '[Copilot]',
          })[entry.source.name]

          return vim_item
        end,
      },
    }
    -- cmp.setup.filetype({ 'sql', 'mysql', 'plsql' }, {
    --   sources = cmp.config.sources {
    --     { name = 'vim-dadbod-completion' },
    --     { source = 'buffer' },
    --   },
    --   mapping = cmp.mapping.preset.insert {
    --     ['<C-Space>'] = cmp.mapping.complete(),
    --   },
    -- })
    cmp.setup.filetype({ 'sql', 'mysql', 'plsql' }, {
      mapping = cmp.mapping.preset.insert {
        ['<C-Space>'] = cmp.mapping(function()
          -- Schedule the sequence of events
          vim.schedule(function()
            -- Insert the dot and immediately delete it
            vim.api.nvim_feedkeys('.', 'n', false)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<BS>', true, true, true), 'n', false)
            -- Then trigger completion
            cmp.complete()
          end)
          return true
        end),
      },
      sources = cmp.config.sources {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
