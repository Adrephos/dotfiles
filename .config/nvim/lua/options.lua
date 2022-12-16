local set = vim.opt
local toggle = true

set.number = toggle
set.relativenumber = toggle
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.mouse = ""

set.swapfile = false
set.backup = false
set.wrap = true

function Number_toggle()
	vim.o.relativenumber = not toggle
	vim.o.number = not toggle
	toggle = not toggle
end

vim.cmd [[colorscheme dracula]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mkdp_auto_start = 1
vim.g.mkdp_refresh_slow = 1

vim.g.vim_jsx_pretty_colorful_config = 1

vim.notify = require('notify')

vim.keymap.set('n', '<F2>', ':lua Number_toggle()<CR>', {})
