return {
  'nvim-lualine/lualine.nvim',
  event = 'ColorScheme',
  config = function()
    require('lualine').setup {
      options = {
        --- @usage 'rose-pine' | 'rose-pine-alt'
        theme = 'rose-pine',
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str) return ' ' .. str end,
            padding = { left = 1, right = 1 },
            separator = { right = '' },
            color = { gui = 'bold' },
          },
        },
        lualine_b = {
          {
            'branch',
            separator = { right = '' },
          },
          {
            'diff',
            separator = { right = '' },
          },
        },
        lualine_y = {
          {
            'progress',
            fmt = function(str) return '󰧱 ' .. str end,
            padding = { left = 1, right = 1 },
            separator = { left = '', right = '' },
          },
        },
        lualine_z = {
          {
            'location',
          },
        },
      },
    }
  end,
}
