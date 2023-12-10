local builtin = require('telescope.builtin')
-- Find Files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) 

-- Search Text
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) 

vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
return{
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }