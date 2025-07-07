return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    -- Changes the StatusLine highlight to the same color of the background. When you change themes, refer to here as the outer edges with coloring errors.
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#181818' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#181818' })
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
      return '  ' .. table.concat(c, '|')
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

    local custom_gruber_darker = require 'lualine.themes.gruvbox_dark'

    custom_gruber_darker.normal.b.fg = '#E4E4E4'
    custom_gruber_darker.insert.b.fg = '#E4E4E4'
    custom_gruber_darker.visual.b.fg = '#E4E4E4'
    custom_gruber_darker.replace.b.fg = '#E4E4E4'
    custom_gruber_darker.command.b.fg = '#E4E4E4'
    custom_gruber_darker.inactive.b.fg = '#E4E4E4'

    custom_gruber_darker.normal.c.fg = '#E4E4E4'
    custom_gruber_darker.normal.c.bg = '#181818'

    require('lualine').setup {
      options = {
        theme = custom_gruber_darker,
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
