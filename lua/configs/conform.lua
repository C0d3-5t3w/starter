local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    scss = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    yaml = { "prettier" },
    go = { "gofmt" },
    rust = { "rustfmt" },
    zig = { "zigfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "black" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    assembly = { "asmfmt" },
    },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
