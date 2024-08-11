require "user.launch"
require "user.keymaps"
require "user.options"

-- Plugins
spec "user.cmp"
spec "user.colorscheme"
spec "user.devicons"
spec "user.lspconfig"
spec "user.mason"
spec "user.none-ls"
spec "user.schemastore"
spec "user.treesitter"
spec "user.whichkey"

-- Initialize lazy after the plugin table is defined
require "user.lazy"
