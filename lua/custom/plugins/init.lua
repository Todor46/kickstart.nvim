-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.keymap.set('n', '<C-s>', '<Cmd>:w<CR>', { desc = 'Save file' })

return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
      local api = require 'nvim-tree.api'
      vim.keymap.set('n', '<leader>t', api.tree.toggle)
    end,
  },
  {
    'phaazon/hop.nvim',
    config = function()
      local hop = require 'hop'
      hop.setup {}
      vim.keymap.set('n', '<leader>p', hop.hint_char1, { desc = 'Hop to a character' })
    end,
  },
  {
    'jiangmiao/auto-pairs',
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Next buffer' },
      { '<leader>w', '<Cmd>bd<CR>', desc = 'Close buffer' },
    },
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          mode = 'buffers',
        },
      }
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local logo = [[
      ████████╗ ██████╗ ██╗     ███████╗███╗   ███╗ █████╗      ██╗███████╗████████╗ ██████╗ ██████╗ 
      ╚══██╔══╝██╔═══██╗██║     ██╔════╝████╗ ████║██╔══██╗     ██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
         ██║   ██║   ██║██║     █████╗  ██╔████╔██║███████║     ██║███████╗   ██║   ██║   ██║██████╔╝
         ██║   ██║   ██║██║     ██╔══╝  ██║╚██╔╝██║██╔══██║██   ██║╚════██║   ██║   ██║   ██║██╔══██╗
         ██║   ╚██████╔╝███████╗███████╗██║ ╚═╝ ██║██║  ██║╚█████╔╝███████║   ██║   ╚██████╔╝██║  ██║
         ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
      ]]
      logo = string.rep('\n', 8) .. logo .. '\n\n'
      -- opts.config.header = vim.split(logo, '\n')
      require('dashboard').setup {
        config = {
          header = vim.split(logo, '\n'),
        },
      }
    end,
  },
}
