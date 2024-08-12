local M = {
  "nanozuki/tabby.nvim",
  event = "VeryLazy",
}

local theme = {
  fill = "TabLineFill",
  head = "TabLine",
  current_tab = "TabLineSel",
  tab = "TabLine",
  tail = "TabLine",
}

local tab_count = function()
  local num_tabs = #vim.api.nvim_list_tabpages()

  if num_tabs > 1 then
    local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
    return tabpage_number .. "/" .. tostring(num_tabs)
  end
end

function M.config()
  require("tabby").setup {
    line = function(line)
      return {
        {
          { " 󰓩  ", hl = theme.head },
          { tab_count(), hl = theme.head },
          { " ", hl = theme.head },
          line.sep("", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep("", hl, theme.fill),
            tab.is_current() and "" or "󰆣",
            tab.number(),
            tab.name(),
            tab.close_btn "",
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
      }
    end,
  }
end

return M
