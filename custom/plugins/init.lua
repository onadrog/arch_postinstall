local override = require "custom.override"

return {

   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
 },

  ["goolord/alpha-nvim"] = {
      disable = false,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["L3MON4D3/LuaSnip"] = {
      config = function()
         require("plugins.configs.others").luasnip()
         require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/custom/snippets" } })
      end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["kyazdani42/nvim-tree.lua"] ={ override_options = override.nvimtree} ,
  ["nvim-treesitter/nvim-treesitter"] = {override_options = override.treesitter},
  ["williamboman/mason.nvim"] = { override_options = override.mason},


 }
