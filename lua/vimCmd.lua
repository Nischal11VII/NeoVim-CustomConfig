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

-- open terminal in horizontal split
vim.api.nvim_set_keymap('n' , '<Leader>t' , ':botright terminal<CR>:startinsert<CR>' , {noremap = true , silent = true})

--close terminal in horizontal split
vim.api.nvim_set_keymap('t', '<Leader>q', [[<C-\><C-n>:q<CR>]], { noremap = true, silent = true })


-- to build a Cmake file 
vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<cr>", { desc = "CMake Build" })

-- to run a CMake file and build if needed
vim.keymap.set("n", "<leader>cr", "<cmd>CMakeRun<cr>", { desc = "CMake Run" })

