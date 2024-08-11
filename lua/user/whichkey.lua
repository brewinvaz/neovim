local M = {
  "folke/which-key.nvim",
}

M.opts = {
  win = {
    padding = { 2, 2 },
  },
}

function M.config()
  local mappings = {
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
    { "<leader>w", "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>", desc = "Wrap" },
    { "<leader>;", "<cmd>tabnew | terminal<CR>", desc = "Term" },
    { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
    { "<leader>b", group = "Buffers" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "LSP" },
    { "<leader>p", group = "Plugins" },
    { "<leader>t", group = "Test" },
    { "<leader>a", group = "Tab" },
    { "<leader>an", "<cmd>$tabnew<CR>", desc = "New Empty Tab" },
    { "<leader>aN", "<cmd>tabnew %<CR>", desc = "New Tab" },
    { "<leader>ao", "<cmd>tabonly<CR>", desc = "Only" },
    { "<leader>ah", "<cmd>-tabmove<CR>", desc = "Move Left" },
    { "<leader>al", "<cmd>+tabmove<CR>", desc = "Move Right" },
    { "<leader>T", group = "Treesitter" },
  }

  local wk = require "which-key"

  wk.add(mappings)
end

return M
