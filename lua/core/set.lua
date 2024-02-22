vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-->:(
local path_separator = vim.fn.has("win32") == 1 and "\\" or "/"
vim.opt.undodir = vim.fn.stdpath("cache") .. path_separator .. "undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.opt.showmode = false

vim.opt.signcolumn = "yes"


-- focus nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")

-- move across windows
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- move across tabs
vim.keymap.set("n", "<C-h>", "<cmd>bp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>bn<CR>")
--vim.keymap.set("n", "<C-j>", "")
--vim.keymap.set("n", "<C-k>", "")

-- split with terminal
vim.keymap.set("n", "<leader>th", "<C-w>v:terminal<CR>i")
vim.keymap.set("n", "<leader>tj", "<C-w>s<C-w>j:terminal<CR>i")
vim.keymap.set("n", "<leader>tk", "<C-w>s:terminal<CR>i")
vim.keymap.set("n", "<leader>tl", "<C-w>v<C-w>l:terminal<CR>i")
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>:terminal<CR>i")
vim.keymap.set("n", "<leader>tT", ":terminal<CR>i")

vim.keymap.set("t", "<Esc>d", "<C-\\><C-n>:bd!<CR>")
vim.keymap.set("t", "<Esc>q", "<C-\\><C-n>:bd!<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc>h", "<C-\\><C-n>:q<CR>")

-- split with new buffer
vim.keymap.set("n", "<leader>nh", ":vnew<CR>")
vim.keymap.set("n", "<leader>nj", "<C-w>s<C-w>j:enew<CR>")
vim.keymap.set("n", "<leader>nk", ":new<CR>")
vim.keymap.set("n", "<leader>nl", "<C-w>v<C-w>l:enew<CR>")
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
vim.keymap.set("n", "<leader>nN", ":enew<CR>")

vim.keymap.set("n", "<leader>q", ":bp<bar>bd #<CR>")
vim.keymap.set("n", "<leader>Q", ":bp<bar>bd! #<CR>")

-- consider making a <leader><Tab> cycle through buffers?
vim.keymap.set("n", "<leader><Tab>", ":e#<CR>")
-- see other actions in after/plugin/telescope.lua


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor as-is when J'ing or gJ'ing
--vim.keymap.set("n", "J", "m`J``")
--vim.keymap.set("n", "gJ", "m`gJ``")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

for i = 1, 10, 1 do
    vim.keymap.set({"n", "t"}, "<M-"..i..">", "<cmd>LualineBuffersJump "..i.."<CR>")
end

-- hardcoded into autoclose plugin (sad, but whatever)
--vim.keymap.set("i", "<C-h>", "<C-w>") 

--vim.keymap.set("i", "<Esc>", "<Esc><cmd>silent write<CR>")

vim.cmd("autocmd TermOpen * setlocal nonu nornu")

