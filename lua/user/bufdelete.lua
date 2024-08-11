local M = {
  "famiu/bufdelete.nvim",
}

function M.config()
  local wk = require "which-key"

  wk.add {
    { "<leader>bc", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
  }
end

return M
