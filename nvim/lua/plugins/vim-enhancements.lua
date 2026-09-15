-- Essential vim enhancements for a more vim-like experience
return {
  -- Better text objects
  {
    "wellle/targets.vim",
    event = "VeryLazy",
  },
  
  -- Vim surround for dealing with pairs
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  
  -- Better . repeat functionality  
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  
  -- Jump anywhere with s/S (explicit maps: the old default mappings hijacked x/X in visual mode)
  {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
      vim.keymap.set({ "n", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
      vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)", { desc = "Leap to other window" })
    end
  },
  
  -- Show marks in sign column
  {
    "kshenoy/vim-signature",
    event = "VeryLazy",
  },
}
