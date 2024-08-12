require "user.autocmds"
require "user.launch"
require "user.keymaps"
require "user.options"

-- Plugins
spec "user.breadcrumbs"
spec "user.bufdelete"
spec "user.cmp"
spec "user.colorscheme"
spec "user.devicons"
spec "user.harpoon"
spec "user.lspconfig"
spec "user.lualine"
spec "user.markdown-preview"
spec "user.mason"
spec "user.navic"
spec "user.none-ls"
spec "user.nvimtree"
spec "user.schemastore"
spec "user.telescope"
spec "user.treesitter"
spec "user.whichkey"

-- Extras
spec "user.extras.codeium"
spec "user.extras.illuminate"
spec "user.extras.neoscroll"
spec "user.extras.oil"
spec "user.extras.tabby"

-- Initialize lazy after the plugin table is defined
require "user.lazy"
