-- FORMATTER
------------

-- Keymap to format
vim.keymap.set("n", "<leader>ff", "<cmd>Format<CR>", {
    noremap = true,
    silent = true,
})

-- Utilities for creating configurations
local util = require("formatter.util")

-- LUA formatter
----------------
local lua_config = {
    -- "formatter.filetypes.lua" defines default configurations for lua
    require("formatter.filetypes.lua").stylua,

    -- You can also define your own configuration
    function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
            return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
            exe = "stylua",
            args = {
                "--search-parent-directories",
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--",
                "-",
            },
            stdin = true,
        }
    end,
}

-- Prettier formatter
---------------------
local prettier_config = {
    function(parser)
        if not parser then
            return {
                exe = "prettier",
                args = {
                    "--stdin-filepath",
                    util.escape_path(util.get_current_buffer_file_path()),
                },
                stdin = true,
                try_node_modules = true,
            }
        end

        return {
            exe = "prettier",
            args = {
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--parser",
                parser,
            },
            stdin = true,
            try_node_modules = true,
        }
    end,
}

-- Generic formatter
--------------------
local all_config = {
    require("formatter.filetypes.any").remove_trailing_whitespace,
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- Formatter config by filetype
    filetype = {
        -- PRETTIER
        css = prettier_config,
        javascript = prettier_config,
        javascriptreact = prettier_config,
        typescriptreact = prettier_config,
        typescript = prettier_config,
        json = prettier_config,
        cpp = prettier_config,
        -- LUA
        lua = lua_config,
        ["*"] = all_config,
    },
})
