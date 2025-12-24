return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'SmiteshP/nvim-navic',
  },
  config = function()
    require("lsp") -- This calls lua/lsp/init.lua
  end,
}
