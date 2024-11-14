-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local icon = {
        kind = {
          Codeium = '',
          Copilot = '',
          TabNine = '󰏚',

          Class = '󰠱',
          Color = '󰏘',
          Constant = '󰏿',
          Constructor = '',
          Enum = '',
          EnumMember = '',
          Event = '',
          Field = '',
          File = '󰈙',
          Folder = '󰉋',
          Function = '󰊕',
          Interface = '',
          Keyword = '󰌋',
          Method = '',
          Module = '󰆧',
          Operator = '󰆕',
          Property = '󰜢',
          Reference = '',
          Snippet = '',
          Text = '',
          TypeParameter = '󰗴',
          Unit = '',
          Value = '󰎠',

          Array = '',
          Boolean = '',
          Collapsed = '',
          Control = '',
          Key = '󰌋',
          Namespace = '󰦮',
          Null = '',
          Number = '󰎠',
          Object = '',
          Package = '',
          String = '',
          Struct = '󰆼',
          Variable = '󰀫',
        },
        git = {
          LineAdded = '',
          LineModified = '',
          LineRemoved = '',
          LineLeft = '▎',
          LineMiddle = '│',
        },
        ui = {
          Search = '',
          Selected = '❯',
          Pointer = '➜',
          Bug = '',
          Circle = '',
          Round = '',
          Ellipsis = '',
          Plus = '',
          Robot = '󰚩',
          LSP = '',
          Fold = '',
          ThinSpace = ' ',
        },
        task = {
          Canceled = ' ',
          Failure = ' ',
          Success = ' ',
          Running = ' ',
        },
        diagnostics = {
          Error = ' ',
          Warning = ' ',
          Info = ' ',
          Hint = ' ',
        },
        spinner = { '', '', '', '', '', '', '', '', '', '', '', '', '' },
        dap = {
          Stopped = { ' ', 'DiagnosticWarn', 'DapStoppedLine' },
          Breakpoint = ' ',
          BreakpointCondition = ' ',
          BreakpointRejected = { ' ', 'DiagnosticError' },
          LogPoint = '󰮔 ',
        },
      }

      local mode = 'mode'

      local filetype = { 'filetype', icon_only = true }

      local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = {
          error = icon.diagnostics.Error,
          hint = icon.diagnostics.Hint,
          info = icon.diagnostics.Info,
          warn = icon.diagnostics.Warning,
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }

      local diff = {
        'diff',
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
        symbols = {
          added = icon.git.LineAdded .. ' ',
          modified = icon.git.LineModified .. ' ',
          removed = icon.git.LineRemoved .. ' ',
        },
        colored = true,
        always_visible = false,
      }

      require('lualine').setup {
        options = {
          theme = 'auto',
          globalstatus = true,
          section_separators = '',
          component_separators = '',
          disabled_filetypes = { statusline = { 'dashboard', 'lazy', 'alpha' } },
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { { 'filename', path = 1 } },
          lualine_c = { diff, diagnostics, 'branch' },
          lualine_x = { "os.date('%a')" },
          lualine_y = { filetype },
          lualine_z = { 'location' },
        },
      }
    end,
  },
}
