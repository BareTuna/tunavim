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
