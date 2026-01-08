return {
  {
    "tiagovla/scope.nvim",
    dependencies = {
    },
    config = function()
      require("scope").setup({
        restore_state = true,
        hooks = {
          pre_tab_leave = function()
            vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
          end,
          post_tab_enter = function()
            vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
          end,
          pre_tab_close = function()
            vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabClosePre" })
          end,
        },
      })
    end,
  },
}

