if true then
  return {}
end
return {
  "codota/tabnine-nvim",
  event = "VeryLazy",
  config = function()
    require("tabnine").setup({
      disable_auto_comment = true,
      accept_keymap = "<tab>",
      dismiss_keymap = "<c-]>",
      debounce_ms = 800,
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = { "telescopeprompt", "neotree" },
      log_file_path = "/home/muneeb/.tabnine/chat/tabnine.log", -- absolute path to tabnine log file
    })
  end,
  build = "./dl_binaries.sh; cd chat; cargo build --release --jobs=100",
  timeout = false,
}
