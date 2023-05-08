-- load options and keymaps before plugins
require("chris.options")
require("chris.keymaps")

-- load and sync plugins
require("chris.plugins")

-- custom configurations for each plugin
require("chris.colorscheme")
require("chris.cmp")
require("chris.lsp")
require("chris.treesitter")
require("chris.toggleterm")
require("chris.telescope")
require("chris.nvim-tree")
require("chris.bufferline")
require("chris.whichkey")
require("chris.gitsigns")
require("chris.comment")
require("chris.lualine")
require("chris.rust-tools")

