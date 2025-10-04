vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Disable line wrapping entirely
    vim.opt_local.wrap = false           -- No automatic wrapping
    vim.opt_local.textwidth = 80         -- Set text width limit to 80 characters
    vim.opt_local.linebreak = true       -- Break lines at spaces (not in words)
    vim.opt_local.colorcolumn = "80"     -- Show visual column at 80 chars

    vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', '<Esc>o<Tab>', { noremap = true, silent = true })
  end
})
