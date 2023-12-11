local g = vim.g
g.lazygit_floating_window_winblend = 1 -- transparency of floating window
g.lazygit_floating_window_scaling_factor = 0.75 -- scaling factor for floating window
g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- customize lazygit popup window border characters
g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1