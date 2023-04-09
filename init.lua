require("plugs")    -- where all the plugins install are
require("keymap")   -- where the keymaps are
require("settings") -- where the settings are

--[[
.
├── init.lua => load all the lua files in the lua folder
├── lua
│   ├── keymap.lua --keymaps
│   ├── plugs.lua --plugins
│   └── settings.lua --settings
├── plugin --plugin settings
│   ├── colors-catppuccin.lua
│   ├── colors.lua
│   ├── colors-rose-pine.lua
│   ├── copilot.lua
│   ├── fugitive.lua
│   ├── gitgutter.lua
│   ├── harpoon.lua
│   ├── lsp.lua
│   ├── lsp_signature.lua
│   ├── lualine.lua
│   ├── packer_compiled.lua
│   ├── telescope.lua
│   ├── toggle-term.lua
│   ├── transparent.lua
│   ├── treesitter.lua
│   ├── undotree.lua
│   └── wilder.lua
└── testing -- just tests
    └── formatter.lua
--]]
