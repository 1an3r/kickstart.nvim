return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    -- Changes the StatusLine highlight to the same color of the background. When you change themes, refer to here as the outer edges with coloring errors.
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#0A0E14' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#f0f0f0' })
    -- Custom Lualine component to show attached language server
    local clients_lsp = function()
      local bufnr = vim.api.nvim_get_current_buf()

      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return ''
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      return ' ' .. table.concat(c, '|')
    end

    -- Custom colours for catppuccin theme:
    --local custom_catppuccin = require 'lualine.themes.catppuccin'
    --[[
    custom_catppuccin.normal.b.fg = '#cad3f5'
    custom_catppuccin.insert.b.fg = '#cad3f5'
    custom_catppuccin.visual.b.fg = '#cad3f5'
    custom_catppuccin.replace.b.fg = '#cad3f5'
    custom_catppuccin.command.b.fg = '#cad3f5'
    custom_catppuccin.inactive.b.fg = '#cad3f5'

    custom_catppuccin.normal.c.fg = '#6e738d'
    custom_catppuccin.normal.c.bg = '#1e2030'
    --]]

    -- Custom colours for gruber-darker theme:

    --[[ local custom_gruvbox = require 'lualine.themes.gruvbox_dark'

    custom_gruvbox.normal.b.fg = '#A89984'
    custom_gruvbox.insert.b.fg = '#A89984'
    custom_gruvbox.visual.b.fg = '#A89984'
    custom_gruvbox.replace.b.fg = '#A89984'
    custom_gruvbox.command.b.fg = '#A89984'
    custom_gruvbox.inactive.b.fg = '#A89984'

    custom_gruvbox.normal.c.fg = '#A89984'
    custom_gruvbox.normal.c.bg = '#282828' ]]
    --

    local ayu_colors = require 'lualine.themes.ayu'

    ayu_colors.normal.b.bg = '#0A0E14'
    ayu_colors.normal.c.bg = '#0A0E14'

    ayu_colors.visual.b.bg = '#0A0E14'
    ayu_colors.insert.b.bg = '#0A0E14'
    ayu_colors.command.b.bg = '#0A0E14'

    require('lualine').setup {
      options = {
        theme = ayu_colors,
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'Outline' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = ' ', right = '' }, icon = '' },
        },
        lualine_b = {
          {
            'filetype',
            icon_only = true,
            padding = { left = 1, right = 0 },
          },
          'filename',
        },
        lualine_c = {
          {
            'branch',
            icon = '',
          },
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            colored = false,
          },
        },
        lualine_x = {
          {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            update_in_insert = true,
          },
        },
        lualine_y = { clients_lsp },
        lualine_z = {
          { 'location', separator = { left = '', right = ' ' }, icon = '' },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      extensions = { 'toggleterm', 'trouble' },
    }
  end,
}
