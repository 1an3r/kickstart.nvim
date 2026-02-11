---@diagnostic disable: undefined-global
return {
  vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save File' }),
  vim.keymap.set('n', '<leader>p', ':pu<CR>', { desc = 'Paste on line below' }),
  vim.keymap.set('n', '<leader>P', ':pu!<CR>', { desc = 'Paste on line above' }),
}
