return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufRead", "BufNewFile" },
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require'nvim-treesitter.configs'.setup {
          -- A list of parser names, or "all"
          ensure_installed = {
              "vimdoc",
              "javascript",
              "typescript",
              "tsx",
              "yaml",
              "html",
              "css",
              "markdown",
              "bash",
              "dockerfile",
              "gitignore",
              "c",
              "lua",
              "rust",
              "vue"
          },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = true,

          highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },

          indent = { enable = true },
          autotag = { enable = true },

          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<cr>",
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },
        }
    end
}

