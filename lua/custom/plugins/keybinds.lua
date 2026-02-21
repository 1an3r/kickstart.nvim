---@diagnostic disable: undefined-global

vim.keymap.set('n', '<leader>dm', [[<cmd>%s/\r$//e<cr>]], { desc = 'Strip Windows ^M' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>p', ':pu<CR>', { desc = 'Paste on line below' })
vim.keymap.set('n', '<leader>P', ':pu!<CR>', { desc = 'Paste on line above' })
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.fileformats = 'unix,dos'
return {}
