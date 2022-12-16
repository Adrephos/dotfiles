-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gi', builtin.git_files, {})
vim.keymap.set('n', '<leader>fi', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- vim-fugitive
vim.keymap.set('n', '<leader>gs', ':Git<CR>')
vim.keymap.set('n', '<leader>gj', ':diffget //3<CR>')
vim.keymap.set('n', '<leader>gf', ':diffget //2<CR>')
vim.keymap.set('n', '<leader>gk', ':Git commit<CR>')

-- nvim-tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

-- HopWord
vim.keymap.set('n', '<leader>hw', ':HopWord<CR>')

-- harpoon
vim.keymap.set('n', '<leader>hf', require('harpoon.mark').add_file, {})
vim.keymap.set('n', '<leader>hl', require('harpoon.ui').toggle_quick_menu, {})

-- Compile c++
function CompileCpp()
	vim.keymap.set('n', '<F8>',' :w <CR> :!clear ; g++ --std=c++17 -o %:r %; if [ -f a.out ]; then time ./a.out; fi <CR>', {})
end
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" },
{
	pattern = { "*.cpp" },
	callback = CompileCpp
})
