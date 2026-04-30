return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local blue_bg = "#252242"
      local selection_bg = "#38346a"

      vim.api.nvim_set_hl(0, "CmpBlueNormal", { bg = blue_bg })
      vim.api.nvim_set_hl(0, "CmpBlueDoc", { bg = blue_bg })
      vim.api.nvim_set_hl(0, "CmpBlueSel", { bg = selection_bg })

      opts.window = {
        completion = {
          border = "none",
          max_height = 10,
          winhighlight = "Normal:CmpBlueNormal,CursorLine:CmpBlueSel,Search:None",
          side_padding = 1,
        },
        documentation = {
          border = "none",
          max_height = 10,
          max_width = 80,
          winhighlight = "Normal:CmpBlueDoc,Search:None",
        },
      }
      opts.performance = {
        max_view_entries = 8,
      }
    end,
  },
}
