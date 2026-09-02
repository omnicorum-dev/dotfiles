return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")

      mc.setup()

      local map = vim.keymap.set

      -- Add cursor above/below
      map({ "n", "x" }, "<leader>mk", function()
        mc.lineAddCursor(-1)
      end, { desc = "Multicursor: Add Above" })

      map({ "n", "x" }, "<leader>mj", function()
        mc.lineAddCursor(1)
      end, { desc = "Multicursor: Add Below" })

      -- Add cursor at next/previous match
      map({ "n", "x" }, "<leader>mn", function()
        mc.matchAddCursor(1)
      end, { desc = "Multicursor: Next Match" })

      map({ "n", "x" }, "<leader>mN", function()
        mc.matchAddCursor(-1)
      end, { desc = "Multicursor: Previous Match" })

      -- Skip next/previous match
      map({ "n", "x" }, "<leader>ms", function()
        mc.matchSkipCursor(1)
      end, { desc = "Multicursor: Skip Match" })

      map({ "n", "x" }, "<leader>mS", function()
        mc.matchSkipCursor(-1)
      end, { desc = "Multicursor: Skip Previous Match" })

      -- Clear
      map("n", "<leader>mc", function()
        mc.clearCursors()
      end, { desc = "Multicursor: Clear" })
    end,
  },
}
