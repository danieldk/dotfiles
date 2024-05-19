return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    keys = { { "<leader>gs", "<cmd>Neogit<CR>", mode = "n", desc = "Open Neogit" } },
    opts = {
      kind = "auto",
    },
  },
}
