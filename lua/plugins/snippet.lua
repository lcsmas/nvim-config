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

    ls.add_snippets('all', {
      s('test-app', {
        t {
          'import { INestApplication } from "@nestjs/common";',
          'import { GqlRequestTest, createApp } from "test/utils";',
          'import { EntityManager } from "typeorm";',
          '',
          '',
        },
        t { "describe('" },
        i(1, 'describe'),
        t "', () => {",
        t { '', '\tlet module: {', '' },
        t { '\t \t \tapp: INestApplication;', '' },
        t { '\t \t \tentityManager: EntityManager;', '' },
        t { '\t \t \tgqlRequest: GqlRequestTest;', '' },
        t { '\t}', '' },
        i(2),
        t { '', '\tbeforeAll(async () => {', '' },
        t { '\t \tmodule = await createApp([])', '' },
        t { '\t \t' },
        i(3),
        t { '', '\t})', '', '\t' },
        i(4),
        t { '', '});' },
      }),
    })
  end,
}
