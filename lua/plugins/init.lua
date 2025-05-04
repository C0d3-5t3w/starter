return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', 
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "github/copilot.vim",
    lazy = false, 
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --       "html", "css", "javascript", "typescript",
  --       "json", "yaml", "markdown", "markdown_inline",
  --       "bash", "dockerfile", "git_rebase", "gitcommit",
  --       "gitignore", "graphql", "regex", "rust",
  --       "go", "gomod", "gosum", "gowork", "hcl",
  --       "proto", "sql", "toml", "tsx", "vue",
  --       "svelte", "scss", "scssdoc", "zls", "zig",
  --       "rust-analyzer", "jsonc",
  -- 		},
  -- 	},
  -- },
}

-- <3
