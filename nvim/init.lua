vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>wt", vim.cmd.tabnew)

local function split_with_explorer(cmd)
    vim.cmd(cmd)
    vim.cmd.Ex()
end

vim.keymap.set("n", "<leader>ws", function() split_with_explorer("split") end, { desc = "Split and browse files" })
vim.keymap.set("n", "<leader>wv", function() split_with_explorer("vsplit") end, { desc = "Vertical split and browse files" })

vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { buffer = bufnr })

---

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
-- vim.opt.wrap = false

-- New splits open below/right instead of above/left
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

-- vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

require("config.lazy")

