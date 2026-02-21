return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status' })
    vim.keymap.set('n', '<leader>ga', ':Git add .<CR>', { desc = 'Git add .' })
    vim.keymap.set('n', '<leader>gc', ':Git commit -m ""<Left>', { desc = 'Git commit message' })
    vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = 'Git push' })
  end,
}
