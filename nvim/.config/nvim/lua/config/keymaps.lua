local map = vim.keymap.set
map("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize split left" })
map("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize split down" })
map("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize split up" })
map("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize split right" })
-- moving between splits
map("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
map("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to down split" })
map("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to up split" })
map("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })