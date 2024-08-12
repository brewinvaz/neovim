local M = {
  "Exafunction/codeium.nvim",
  event = "BufEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
}

function M.config()
  require("codeium").setup {
    enable_chat = true,
  }
end

return M