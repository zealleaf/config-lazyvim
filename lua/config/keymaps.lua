-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local opts = {
  noremap = true,
  silent = true,
}

map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$")
map("v", "K", ":move '<-2<CR>gv-gv", opts)
map("v", "J", ":move '>+1<CR>gv-gv", opts)
map("n", "<c-d>", "5j")
map("n", "<c-u>", "5k")
map("v", "<c-d>", "5j")
map("v", "<c-u>", "5k")
map({ "n", "v" }, ";", "<Nop>", opts)
map({ "n", "v" }, ",", "<Nop>", opts)
map("n", "<c-n>", ":nohlsearch<CR>", opts) -- Clear search highlights
map("n", "x", '"_x') -- Delete single character without copying into register

if vim.g.vscode then
  -- Buffer management --
  map("n", "<leader>bo", "<Cmd>lua require('vscode').call('workbench.action.closeOtherEditors')<CR>")
  map("n", "<leader>bd", "<Cmd>lua require('vscode').call('workbench.action.closeActiveEditor')<CR>")

  -- Fold --
  map("n", "zc", "<Cmd>lua require('vscode').call('editor.fold')<CR>")
  map("n", "zC", "<Cmd>lua require('vscode').call('editor.foldAll')<CR>")
  map("n", "za", "<Cmd>lua require('vscode').call('editor.toggleFold')<CR>")
  map("n", "zR", "<Cmd>lua require('vscode').call('editor.unfoldAll')<CR>")
  map("n", "zM", "<Cmd>lua require('vscode').call('editor.foldAll')<CR>")
  map("n", "zo", "<Cmd>lua require('vscode').call('editor.unfold')<CR>")
  map("n", "zO", "<Cmd>lua require('vscode').call('editor.unfoldRecursively')<CR>")
  map("n", "zC", "<Cmd>lua require('vscode').call('editor.foldRecursively')<CR>")
  map("n", "z1", "<Cmd>lua require('vscode').call('editor.foldLevel1')<CR>")
  map("n", "z2", "<Cmd>lua require('vscode').call('editor.foldLevel2')<CR>")
  map("n", "z3", "<Cmd>lua require('vscode').call('editor.foldLevel3')<CR>")
  map("n", "z4", "<Cmd>lua require('vscode').call('editor.foldLevel4')<CR>")
  map("n", "z5", "<Cmd>lua require('vscode').call('editor.foldLevel5')<CR>")
  map("n", "z6", "<Cmd>lua require('vscode').call('editor.foldLevel6')<CR>")
  map("n", "z7", "<Cmd>lua require('vscode').call('editor.foldLevel7')<CR>")
  map("x", "zV", "<Cmd>lua require('vscode').call('editor.foldAllExcept')<CR>")

  -- LSP --
  -- Navigation
  map("n", "gd", "<Cmd>lua require('vscode').call('editor.action.revealDefinition')<CR>")
  map("n", "gr", "<Cmd>lua require('vscode').call('editor.action.goToReferences')<CR>")
  map("n", "gD", "<Cmd>lua require('vscode').call('editor.action.revealDeclaration')<CR>")
  map("n", "gI", "<Cmd>lua require('vscode').call('editor.action.goToImplementation')<CR>")
  map("n", "gy", "<Cmd>lua require('vscode').call('editor.action.goToTypeDefinition')<CR>")
  -- Hover and Signature Help
  map("n", "K", "<Cmd>lua require('vscode').call('editor.action.showHover')<CR>")
  map("n", "gK", "<Cmd>lua require('vscode').call('editor.action.triggerParameterHints')<CR>")
  map("n", "<C-k>", "<Cmd>lua require('vscode').call('editor.action.triggerParameterHints')<CR>")
  -- Code Actions and Refactoring
  map("n", "<leader>cf", "<Cmd>lua require('vscode').call('editor.action.formatDocument')<CR>")
  map("v", "<leader>cf", "<Cmd>lua require('vscode').call('editor.action.formatSelection')<CR>")
  map("n", "<leader>ca", "<Cmd>lua require('vscode').call('editor.action.quickFix')<CR>")
  map("n", "<leader>cA", "<Cmd>lua require('vscode').call('editor.action.sourceAction')<CR>")
  map("n", "<leader>cr", "<Cmd>lua require('vscode').call('editor.action.rename')<CR>")
  -- Diagnostics
  map("n", "<leader>cd", "<Cmd>lua require('vscode').call('editor.action.showHover')<CR>")
  map("n", "<leader>cl", "<Cmd>lua require('vscode').call('workbench.action.output.toggleOutput')<CR>")
  map("n", "]d", "<Cmd>lua require('vscode').call('editor.action.marker.next')<CR>")
  map("n", "[d", "<Cmd>lua require('vscode').call('editor.action.marker.prev')<CR>")
  map("n", "]e", "<Cmd>lua require('vscode').call('editor.action.marker.next')<CR>")
  map("n", "[e", "<Cmd>lua require('vscode').call('editor.action.marker.prev')<CR>")
  map("n", "]w", "<Cmd>lua require('vscode').call('editor.action.marker.next')<CR>")
  map("n", "[w", "<Cmd>lua require('vscode').call('editor.action.marker.prev')<CR>")

  -- Git --
  map("n", "<leader>ghd", "<Cmd>lua require('vscode').call('git.openChange')<CR>")

  -- Others --
  map("n", "<c-s>", "<Cmd>lua require('vscode').call('workbench.action.files.save')<CR>")
  map("n", "<c-/>", "<Cmd>lua require('vscode').call('workbench.action.terminal.toggleTerminal')<CR>")
  map("n", "<leader>e", "<Cmd>lua require('vscode').call('workbench.view.explorer')<CR>")
  map("n", "<leader>,", "<Cmd>lua require('vscode').call('workbench.files.action.focusOpenEditorsView')<CR>")
  map("n", "<leader>a", "<Cmd>lua require('vscode').call('workbench.action.toggleAuxiliaryBar')<CR>")
  map("n", "<leader>l", "<Cmd>lua require('vscode').call('workbench.view.extensions')<CR>")
  map("n", "<leader>gg", "<Cmd>lua require('vscode').call('lazygit-vscode.toggle')<CR>")
  map("n", "<leader>yy", "<Cmd>lua require('vscode').call('yazi-vscode.toggle')<CR>")
end
