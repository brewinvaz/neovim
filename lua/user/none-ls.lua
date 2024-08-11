local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"
  local formatting = null_ls.builtins.formatting

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      require "none-ls.diagnostics.flake8", -- flake8 is moved to none-ls-extras
      null_ls.builtins.completion.spell,
    },
  }
end

return M
