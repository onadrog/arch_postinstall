local M = {}
--local override = require "custom.override"
--
--M.plugins = {
--
--   override = {
--      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
--      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
--      ["williamboman/mason"] = override.mason,
--   },
--
--   user = require "custom.plugins",
--}

M.plugins = require "custom.plugins"

M.ui = {
   theme = "tokyonight",
}

return M
