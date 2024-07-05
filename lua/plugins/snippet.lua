return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local sn = ls.snippet_node

    ls.add_snippets('all', {
      s('trigger', {
        t 'This is a custom snippet. ',
        i(1, 'Type something here'),
        t ' ',
        i(2, 'And here'),
      }),
    })
  end,
}
