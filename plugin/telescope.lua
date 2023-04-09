-- TELESCOPE
------------
local telescope = require("telescope")

-- Configure telescope to search hidden files, (except .git and .node_modules)
telescope.setup({
	pickers = {
		find_files = {
			find_command = {
				"fd",
                ".",
				"--files",
				"--hidden",
				"--glob",
				"!.git",
				"--glob",
				"!node_modules", --]]
			},
		},
	},
})

telescope.load_extension "file_browser"
-- Keymaps
local builtin = require("telescope.builtin")

-- Find file name in project
vim.keymap.set("n", "<leader>fs", builtin.fd, {})
-- Find file name in git project
vim.keymap.set("n", "<leader>gs", builtin.git_files, {})
-- String search across project (RIPGrep)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- Use to view help documentation
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
-- View recently opened files
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

