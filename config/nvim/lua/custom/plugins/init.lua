-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'echasnovski/mini.bufremove',
    version = '*',
    keys = {
      { '<leader>q', function() require('mini.bufremove').delete() end, desc = 'Close buffer' },
    },
  },
}
