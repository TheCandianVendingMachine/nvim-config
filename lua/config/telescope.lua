local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-s>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<C-a>', builtin.buffers, {})
