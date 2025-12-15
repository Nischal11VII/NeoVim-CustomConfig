vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
-- Disable expandtab for Makefiles
vim.cmd([[
augroup MakefileTab
  autocmd!
  autocmd FileType make set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
augroup END
]])

vim.g.mapleader  = " "

vim.api.nvim_set_keymap('n' , '<Leader>t' , ':botright terminal<CR>:startinsert<CR>' , {noremap = true , silent = true})
vim.api.nvim_set_keymap('t', '<Leader>q', [[<C-\><C-n>:q<CR>]], { noremap = true, silent = true })

