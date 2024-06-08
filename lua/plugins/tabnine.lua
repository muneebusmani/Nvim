if true then return {} end
return
  {
    'codota/tabnine-nvim',
    event = "VeryLazy",
    config = function()
      require('tabnine').setup({
        disable_auto_comment=true,
        accept_keymap="<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = {gui = "#808080", cterm = 244},
        exclude_filetypes = {"TelescopePrompt", "Neotree"},
        log_file_path = "~/.tabnine/chat/tabnine.log", -- absolute path to Tabnine log file
      })
    end,
    build = "./dl_binaries.sh; cd chat; cargo build --release --jobs=100",
    timeout = false
  }
