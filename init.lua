require "user.launch"
require "user.keymaps"
require "user.options"

-- Plugins
spec "user.bufdelete"
spec "user.cmp"
spec "user.colorscheme"
spec "user.devicons"
spec "user.lspconfig"
spec "user.lualine"
spec "user.markdown-preview"
spec "user.mason"
spec "user.none-ls"
spec "user.nvimtree"
spec "user.schemastore"
spec "user.telescope"
spec "user.treesitter"
spec "user.whichkey"

-- Initialize lazy after the plugin table is defined
require "user.lazy"
