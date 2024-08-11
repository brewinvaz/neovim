require "user.launch"
require "user.keymaps"
require "user.options"

spec "user.colorscheme"
spec "user.devicons"
spec "user.lspconfig"
spec "user.mason"
spec "user.treesitter"
spec "user.schemastore"
spec "user.whichkey"

-- Initialize lazy after the plugin table is defined
require "user.lazy"
