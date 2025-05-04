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

	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"j-hui/fidget.nvim",
		},
		opts = {
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = "copilot",
				},
			},
			adapters = {},
		},
		config = function(_, opts)
			local api_key = ""
			local handle = io.popen("pass copilot/api_key")
			if handle then
				api_key = handle:read("*a"):gsub("%s+$", "")
				handle:close()
			end

			opts.adapters.anthropic = function()
				return require("codecompanion.adapters").extend("copilot", {
					env = {
						api_key = api_key,
					},
				})
			end

			require("codecompanion").setup(opts)

			local progress = require("fidget.progress")
			local handles = {}
			local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

			vim.api.nvim_create_autocmd("User", {
				pattern = "CodeCompanionRequestStarted",
				group = group,
				callback = function(e)
					handles[e.data.id] = progress.handle.create({
						title = "CodeCompanion",
						message = "Thinking...",
						lsp_client = { name = e.data.adapter.formatted_name },
					})
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "CodeCompanionRequestFinished",
				group = group,
				callback = function(e)
					local h = handles[e.data.id]
					if h then
						h.message = e.data.status == "success" and "Done" or "Failed"
						h:finish()
						handles[e.data.id] = nil
					end
				end,
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
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
