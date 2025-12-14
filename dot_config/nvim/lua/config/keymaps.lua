-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here

-- Define a variable

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Use the variable
vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set("n", "<leader><tab>", "<cmd>q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "J", "<cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "K", "<cmd>bprevious<CR>", { noremap = true, silent = true })
map("n", "j", "jzz", opts)
map("n", "<leader>q", "<cmd>tabclose", opts)
map("n", "k", "kzz", opts)
map("n", "<leader>j", "J")
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "J", ":m .+1<CR>==zz", opts)
map("v", "K", ":m .-2<CR>==zz", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("n", "<S-Right>", ":vertical resize +5<CR>", opts)
map("n", "<S-Left>", ":vertical resize -5<CR>", opts)
map("n", "<S-Down>", ":resize +5<CR>", opts)
map("n", "<S-Up>", ":resize -5<CR>", opts)
map({ "n", "x" }, "d", '"_d', { silent = true })
map({ "n", "x" }, "D", '"_D', { silent = true })

map({ "n", "x" }, "y", '"+y', { silent = true })
map({ "n", "x" }, "Y", '"+Y', { silent = true })
map("n", "p", '"+p', { silent = true })
map("n", "P", '"+P', { silent = true })
-- map("n", "<leader>sa", 'gg"+yG', opts)
map("n", "<leader>da", 'gg"_dG', opts)
map("n", "<leader>ya", 'gg"+yG``', opts)
vim.keymap.set("n", "<leader>q", ":bd<CR>", opts)
vim.keymap.set("n", "gp", 'o<esc>"+p', { silent = true })
vim.keymap.set("n", "gP", 'O<esc>"+p', { silent = true })
map("n", "<leader>sa", "ggVG", opts)
-- pasted from dotfiles
map("n", "<leader>j", "J")
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "J", ":m .+1<CR>==zz", opts)
map("v", "K", ":m .-2<CR>==zz", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("n", "n", "nzz", opts)

-- Mapping leader tt to open a new tab
map("n", "<leader>tt", ":tabnew<CR>", opts)
-- Map 'N' to search backward and center the result on the screen
map("n", "N", "Nzz", opts)
-- Source the current file using <leader>sf
map("n", "<leader>sf", ":source %<CR>", opts)
-- Prevent content from being placed in clipboard when deleting (use black hole register)
map("n", "d", '"_d', opts)
map("n", "dd", '"_dd', opts)
map("v", "d", '"_d', opts)
map("v", "D", '"_D', opts)
-- Map <Leader>d to yank to clipboard
map("n", "<Leader>d", '"+y', opts)
map("v", "<Leader>d", '"+y', opts)

-- Replace paste with black hole register
map("v", "p", '"_dP', opts)

-- Map [{ and ]} to center the screen after jumping
map("n", "[{", "{zz", { noremap = true, silent = true, desc = "Jump to previous block and center" })
map("n", "]}", "}zz", { noremap = true, silent = true, desc = "Jump to next block and center" })

map("n", "<leader>ss", function()
  require("telescope.builtin").live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, { desc = "[S]earch [/] in Open Files" })

map("n", "<leader><leader>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
