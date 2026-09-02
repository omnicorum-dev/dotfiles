return {
  {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("gruber-darker").setup(opts)
      vim.cmd.colorscheme("gruber-darker")
    end,
  },
}
