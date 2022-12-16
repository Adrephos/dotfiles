local cmp = require('cmp')
vim.g.completeopt = 'menu,menuone,noselect,noinsert'

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({ border = 'rounded' }),
		documentation = cmp.config.window.bordered({ border = 'rounded' }),
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping.select_next_item(select_opts),
		['<S-Tab>'] = cmp.mapping.select_prev_item(select_opts),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<S-CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = '-',
				vsnip = '>',
				buffer = '|',
				path = '/:',
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})
