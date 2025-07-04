-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = {
  noremap = true,
  silent = true,
}

-- General
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("n", "<c-d>", "10j")
vim.keymap.set("n", "<c-u>", "10k")
vim.keymap.set("v", "<c-d>", "10j")
vim.keymap.set("v", "<c-u>", "10k")
vim.keymap.set({ "n", "v" }, ";", "<Nop>", opts)
vim.keymap.set({ "n", "v" }, ",", "<Nop>", opts)

-- Clear search highlights
vim.keymap.set("n", "<c-n>", ":nohlsearch<CR>", opts)

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x')
