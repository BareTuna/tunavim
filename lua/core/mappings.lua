local function map(mode, keys, action, desc)
    desc = desc or ""
    local opts = { noremap = true, silent = true, desc = desc }
    vim.keymap.set(mode, keys, action, opts)
end

return {
    lsp = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Diagnostics mappings
                map("n", "[d", function()
                    vim.diagnostic.goto_prev { float = false }
                end, "Diagnostics goto_prev")

                map("n", "]d", function()
                    vim.diagnostic.goto_next { float = false }
                end, "Diagnostics goto_next")
                map("n", "<leader>sd", vim.diagnostic.setloclist)

                map("n", "<leader>hi", function()
                    local is_enabled = vim.lsp.inlay_hint.is_enabled()
                    vim.lsp.inlay_hint.enable(0, not is_enabled)
                end, "Toggle inlay hint")

                map("n", "K", vim.lsp.buf.hover, "Toggle lsp hover")
                map("n", "<leader>d", function()
                    vim.diagnostic.open_float()
                end, "Toggle lsp hover")
                --map("n", "<leader>ld", vim.lsp.buf.definition, "Toggle lsp definition")
                --map("n", "<leader>lh", vim.lsp.buf.declaration, "Goto lsp declaration")
                --map("n", "<leader>lt", vim.lsp.buf.type_definition, "Goto lsp definition")
                --map("n", "<leader>li", vim.lsp.buf.implementation, "Goto lsp implementation")
                --map("n", "<leader>lr", vim.lsp.buf.references, "Goto lsp reference")
                --map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Open lsp code action")
                --map("n", "<leader>lf", function()
                --    vim.lsp.buf.format { async = true }
                --end, "Lsp format")
                --map("n", "<leader>lc", vim.lsp.buf.rename, "Lsp rename")
                --map({ "i", "s" }, "<c-space>", vim.lsp.buf.signature_help, "Lsp signature help")
            end,
        })
    end,
}
