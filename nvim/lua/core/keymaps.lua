vim.g.mapleader = " "

-- Basic keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<D-q>", ":qa!<CR>", { noremap = true, silent = true, desc = "Quit all" })

-- Custom Python Runner
require("plugins.python-run")
