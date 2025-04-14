return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "github/copilot.vim",
    lazy = false, -- Ensure it loads immediately
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript",
        "json", "yaml", "markdown", "markdown_inline",
        "bash", "dockerfile", "git_rebase", "gitcommit",
        "gitignore", "graphql", "regex", "rust",
        "go", "gomod", "gosum", "gowork", "hcl",
        "proto", "sql", "toml", "tsx", "vue",
        "svelte", "scss", "scssdoc", "zls", "zig",
        "rust-analyzer", "jsonc",
  		},
  	},
  },
}

-- <3
