
	return {
		'hrsh7th/nvim-cmp',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
		},
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        completion = {
          completeopt = 'menu,menuone,preview,noselect',
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp"},
          { name = "luasnip" }, -- snippets
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
        }),
      })

    end
	}
