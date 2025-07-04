return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('lualine').setup {
        options = {
          theme = 'auto',
        },
      }
    end,
  },
}
