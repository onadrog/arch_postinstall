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
    "jsonls",
    "lemminx",
    "marksman",
    "gopls",
    "tsserver"
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
}

M.luasnip = {
   opts = {
      paths = {
         "./snippets",
      }
   }
}

return M
