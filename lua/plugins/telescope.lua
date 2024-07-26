return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- if encountering errors, see telescope-fzf-native readme for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- this is only run then, not every time neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- useful for getting pretty icons, but requires a nerd font.
    {
      'nvim-tree/nvim-web-devicons',
      enabled = vim.g.have_nerd_font
    },
  },
  event = 'VimEnter',
  lazy = false,
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = {
          horizontal = {
            height = 0.99,
            width = 0.99,
            preview_width = 0.6,
          },
        },
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
          },
        },
      },
      pickers = {
        current_buffer_fuzzy_find = {
          theme = "dropdown",
          previewer = false,
          layout_config = {
            height = 0.9,
            width = 0.8,
          }
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
          layout_config = {
            height = 0.8,
            width = 0.8,
          }
        }
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
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
    pcall(require('telescope').load_extension, 'ui-select')

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
    vim.keymap.set('n', '<leader>s.', require('telescope.builtin').live_grep, { desc = '[s]earch by [g]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
    vim.keymap.set('n', '<leader>sc', '<cmd>Telescope find_files cwd=~/.config<CR>', { desc = '[s]earch [c]onfig' })
    vim.keymap.set('n', '<leader>sw', '<cmd>Telescope find_files cwd=~/Others/Workspace<CR>',
      { desc = '[S]earch [W]orkspace' })
    vim.keymap.set('n', '<leader>so', '<cmd>Telescope oldfiles<CR>', { desc = '[s]earch [o]ldfiles' })
    vim.keymap.set('n', '<leader>sth', '<cmd>Telescope highlights<CR>', { desc = '[s]earch [t]elescope [h]ighlights' })
    vim.keymap.set('n', '<leader>st', '<CMD>Telescope colorschemes<CR>', { desc = "[s]how [t]hemes" })
  end
}
