return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local h = require 'null-ls.helpers'

    local my_custom_source = {
      name = 'my_custom_source',
      method = null_ls.methods.DIAGNOSTICS, -- or FORMATTING, CODE_ACTION, COMPLETION
      filetypes = {}, -- filetypes it should run on
      generator = {
        async = true,
        fn = function(params, done)
          local Job = require 'plenary.job'

          ---@diagnostic disable-next-line: missing-fields
          Job:new({
            command = 'node_modules/.bin/eslint',
            args = { '.', '--format', 'json' },
            -- args = { '.', '--format', 'json' },

            on_exit = function(j, return_code)
              local diagnostics = {}

              if return_code ~= 0 then
                print('ESLint failed with code ' .. return_code)
                done()
                return
              end

              local job_result = j:result()

              if not job_result or #job_result == 0 then
                done()
                return
              end

              local linting_results = vim.json.decode(job_result[1])

              for _, linting_result in pairs(linting_results) do
                if linting_result.messages and #linting_result.messages > 0 then
                  for _, message in pairs(linting_result.messages) do
                    print(vim.inspect(message))
                    table.insert(diagnostics, {
                      row = message.line,
                      col = message.column,
                      end_row = message.endLine,
                      end_col = message.endColumn,
                      sources = 'eslint',
                      message = message.message,
                      severity = h.diagnostics.severities[message.severity == 2 and 'error' or 'warning'],
                    })
                  end
                end
              end
              done(diagnostics)
            end,
          }):start()

          -- messages = { {
          --      column = 56,
          --      endColumn = 57,
          --      endLine = 4,
          --      line = 4,
          --      message = "'a' is defined but never used.",
          --      messageId = "unusedVar",
          --      nodeType = "Identifier",
          --      ruleId = "@typescript-eslint/no-unused-vars",
          --      severity = 1
          --    }, {
          --      column = 27,
          --      endColumn = 28,
          --      endLine = 10,
          --      line = 10,
          --      message = "'e' is defined but never used.",
          --      messageId = "unusedVar",
          --      nodeType = "Identifier",
          --      ruleId = "@typescript-eslint/no-unused-vars",
          --      severity = 1
          --    } },

          --
          -- end
        end,
      },
    }

    null_ls.setup {
      sources = {
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.hover.printenv,
        -- my_custom_source,
      },
    }
  end,
}
