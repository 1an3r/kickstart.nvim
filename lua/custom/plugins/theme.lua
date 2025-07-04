return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('kanagawa').setup {
        commentStyle = {
          italic = false,
        },
        theme = 'wave',
      }
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
