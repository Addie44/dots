return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function() return vim.fn.executable("make") == 1 end,
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
      },
    })

    pcall(telescope.load_extension, "fzf")

    vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>")
    vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<CR>")
    vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
  end
}
