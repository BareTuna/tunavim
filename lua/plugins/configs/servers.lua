local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    filetypes = { "lua" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            completion = {
                callSnippet = "Replace",
            },
            diagnostics = {
                globals = { "vim" },
            },
            hint = {
                enable = true,
            },
        },
    },
})

lspconfig.bashls.setup({
    single_file_support = true,
})

vim.g.rustaceanvim = {
  -- Plugin configuration
  -- tools = {},
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "J", "<cmd>RustLsp joinLines<CR>", opts)
        vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>", opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set({"n", "v"}, "<leader>ia", "<cmd>RustLsp codeAction<CR>", opts)
        vim.keymap.set("n", "<leader>ic", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>id", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>if", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "<leader>igd", vim.lsp.buf.definition, opts)
        vim.keymap.set({"n", "v"}, "<leader>iha", "<cmd>RustLsp hover actions<CR>", opts)
        vim.keymap.set({"n", "v"}, "<leader>ihr", "<cmd>RustLsp hover range<CR>", opts)
        vim.keymap.set("n", "<leader>il", function()
            vim.lsp.inlay_hint.enable(
                bufnr,
                not vim.lsp.inlay_hint.is_enabled(bufnr)
            )
        end, opts)
        vim.keymap.set("n", "<leader>ird", "<cmd>RustLsp renderDiagnostic<CR>", opts)
        vim.keymap.set("n", "<leader>iref", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>irpm", "<cmd>RustLsp rebuildProcMacros<CR>", opts)
        vim.keymap.set("n", "<leader>iws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>ie", "<cmd>RustLsp expandMacro<CR>", opts)

        vim.cmd("autocmd BufWritePre *.rs RustFmt")
        vim.cmd("autocmd TextChanged,InsertLeave *.rs write | doautocmd BufWritePost")
        --vim.cmd("autocmd TextChanged,TextChangedI *.rs doautocmd BufWriteCmd")
        --vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
    default_settings = {
        ['rust-analyzer'] = {
            --["inlayHints"] = {
            --    ["closureCaptureHints"] = {
            --        enable = true,
            --    },
            --},
            ["completion"] = {
                ["autoimport"] = {
                    enable = true,
                },
            },
        },
    },
  },
  -- DAP configuration
  -- dap = {},
}
