local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {
        b.formatting.prettier,
        b.formatting.xmllint,
        b.formatting.phpcsfixer,
        b.formatting.gofumpt,
        b.formatting.djlint.with({
            filetypes = {"twig"},
            extra_args = {"--profile=nunjucks"}
        })

   }

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
   debug = true,
   sources = sources,
   on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
}
