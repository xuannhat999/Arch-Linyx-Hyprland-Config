return {
  "diogof146/java-project-creator.nvim",
  dependencies = { "MunifTanjim/nui.nvim" }, -- Optional but recommended for UI
  keys = { "<leader>jnp", "<leader>mnp" },
  config = function()
    require("java-project-creator").setup({
      base_path = vim.fn.getcwd(), -- Default path for new projects
      default_java_version = "21", -- Java version to use (supports 8-21)
      default_group_id = "com.nhatpon", -- Default Maven group ID
      default_artifact_id = "myapp", -- Default Maven artifact ID
      default_version = "1.0-SNAPSHOT", -- Default Maven version
      maven_cmd = "mvn", -- Maven command to use
      keymaps = {
        new_java_project = "<leader>jnp", -- Keymap for new Java project
        new_maven_project = "<leader>mnp", -- Keymap for new Maven project
      },
    })
  end,
}
