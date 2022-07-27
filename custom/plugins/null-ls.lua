local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {
        b.formatting.prettierd,
        b.formatting.xmllint,
        --b.diagnostics.golangci_lint,
        b.formatting.phpcsfixer,
        b.formatting.gofumpt,
        b.formatting.djlint.with({
            filetypes = {"twig"},
            extra_args = {"--profile=nunjucks"}
        })

   }


null_ls.setup {
   debug = true,
   sources = sources,
}
