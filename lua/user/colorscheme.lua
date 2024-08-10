local M = {
  "EdenEast/nightfox.nvim",
  lazy = false, -- load during startup because it is the main colorscheme
  priority = 1000, -- load this before all the other start plugins
}

function M.config()
  vim.cmd.colorscheme "nordfox"
end

return M
