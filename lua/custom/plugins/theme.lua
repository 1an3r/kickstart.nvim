return {
  {
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('catppuccin').setup {
        styles = {
          comments = {
            'italic',
          },
        },
      }
      --vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'blazkowolf/gruber-darker.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('gruber-darker').setup {
        italic = {
          comments = false,
        },
      }
      vim.cmd.colorscheme 'gruber-darker'
    end,
  },
}
