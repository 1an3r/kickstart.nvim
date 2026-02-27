-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'clipboard-fix',
  virtual = true,
  config = function()
    if vim.fn.has 'win32' == 1 then
      vim.g.clipboard = {
        name = 'win32yank-fixed',
        copy = {
          ['+'] = 'win32yank.exe -i --crlf',
          ['*'] = 'win32yank.exe -i --crlf',
        },
        paste = {
          ['+'] = 'win32yank.exe -o --lf',
          ['*'] = 'win32yank.exe -o --lf',
        },
        cache_enabled = 0,
      }
    end
  end,
}
