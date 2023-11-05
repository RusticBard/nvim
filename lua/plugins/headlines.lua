return {
  'lukas-reineke/headlines.nvim',
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function() -- or `opts = {}`
    norg = {
        headline_highlights = {"Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6"},
        codeblock_highlight = {"NeorgCodeBlock"},
    }
  end,
}
