return {
  {
    "folke/noice.nvim",
    opts = {
      views = {
        shell_output = {
          view = "split",
          enter = true,
          size = "auto",
          close = {
            keys = { "q", "<Esc>" },
          },
        },
      },

      routes = {
        {
          view = "shell_output",
          filter = {
            event = "msg_show",
            kind = {
              "shell_out",
              "shell_err",
            },
          },
        },
      },
    },
  },
}
