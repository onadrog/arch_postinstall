local M = {}

M.treesister = {
  ensure_installed = {
    "bash",
    "css",
    "dot",
    "html",
    "javascript",
    "json5",
    "make",
    "markdown",
    "php",
    "phpdoc",
    "scss",
    "typescript",
    "yaml",
    "go"
  }
}

M.mason = {
  ensure_installed = {
    "html-lsp",
    "bash-language-server",
    "dockerfile-language-server",
    "intelephense",
    "css-lsp",
    "yaml-language-server",
    "json-lsp",
    "lemminx",
    "marksman",
    "gopls",
    "typescript-language-server"
  }
}

M.nvimtree = {
   git = {
      enable = true,
      ignore = false
   },

   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },
  view = {
    side = "right"
  }
}

M.luasnip = {
   opts = {
      paths = {
         "./snippets",
      }
   }
}

return M
