-- Fix clangd offset encoding warning.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local opts = { capabilities = capabilities }
require("lvim.lsp.manager").setup("clangd", opts)

require("lvim.lsp.manager").setup("marksman")
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })


-- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "jedi_language_server"
end, lvim.lsp.automatic_configuration.skipped_servers)



local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup {
  { command = "autopep8",    filetypes = { "python" } },
  { name = "npm_groovy_lint", command = "npm-groovy-lint",
    args = { "--format", "-" }, to_stdin = true, },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    -- filetypes = { "typescript", "typescriptreact", "markdown" },
  },
  { command = "latexindent", filetypes = { "tex" } },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }
