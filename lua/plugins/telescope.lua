return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  lazy = false,
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = {
          horizontal = {
            height = 99999,
            width = 99999,
            preview_width = 0.6,
          },
        },
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
          },
        },
      },
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { "png", "webp", "jpg", "jpeg" },
          find_cmd = "rg" -- find command (defaults to `fd`)
        }
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'media_files')

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find {
        -- winblend = 10,
      }
    end, { desc = '[/] Fuzzily search in current buffer]' })

    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch [h]elp' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').grep_string, { desc = '[s]earch current [w]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[s]earch by [g]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
    vim.keymap.set('n', '<leader>sc', '<cmd>Telescope find_files cwd=~/.config<CR>', { desc = '[s]earch [f]iles' })
    vim.keymap.set('n', '<leader>sw', '<cmd>Telescope find_files cwd=~/Others/Workspace<CR>', { desc = '[S]earch [W]orkspace'})
    vim.keymap.set('n', '<leader>so', '<cmd>Telescope oldfiles<CR>', { desc = '[s]earch [o]ldfiles' })
  end
}
