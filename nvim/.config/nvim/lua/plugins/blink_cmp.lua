return {
  {
    "saghen/blink.cmp",
    --- @module 'blink.cmp'
    --- @type blink.Config
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "dadbod" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
          mysql = { "snippets", "dadbod", "buffer" },
          sqlite = { "snippets", "dadbod", "buffer" },
          postgresql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
          },
        },
      },
    },
  },
}
