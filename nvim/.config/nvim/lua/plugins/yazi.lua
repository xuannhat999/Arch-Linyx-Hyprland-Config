return {
  -- @type LazySpec
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    -- event = "VeryLazy",
    keys = {
      {
        "<leader>-",
        "<cmd>Yazi toggle<cr>",
        mode = { "n", "v" },
        desc = "Yazi",
      },
    },
    ----@type YaziConfig | {}
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
}
