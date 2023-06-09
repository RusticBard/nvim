return {
  "kabouzeid/nvim-jellybeans",
  dependencies = "rktjmp/lush.nvim",

  config = function()
    vim.cmd('highlight MsgArea guibg=#1c1c1c gui=bold guisp=NONE')
  end,
}
