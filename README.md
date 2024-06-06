# 💤 LazyVim 

## Laravel Native

This config is setup with the best available dev tooling for laravel, Flutter, and React

### Laravel
- Intelephense
- Blade Language Support
- Blade Formatter
- Pint
- Phpstan (make sure you configure larastan in your project)
- Rustywind
- Tailwind LS
- XDebug with configuration for Laravel Sail
- Treesitter beta for blade files included


### Flutter
- Code actions
- Refactor
- Quickfix
- Linting
- Foratting
- View and Run Devices inside neovim
- Basically whole android studio functionality

### React
- Lazy Extras : typescript,eslint,prettier

## Additions

### Requirements

If you encounter an issue with `Intelephense` not recognising facade or model function calls, you will need to install [Laravel IDE Helper](https://github.com/barryvdh/laravel-ide-helper) into your project and execute the relevant artisan commands. Thanks to [@ermand](https://github.com/ermand) for bringing up the issue as well as the solution.

Make sure you install all TreeSitter parsers by doing:
`:TSInstall all` and `:TSInstall php_only`.
This will install both the experimental blade parser, for which configuration is included in this config, as well as the php_only parser, which is needed for it to work fully.
For some reason php_only is not included in `all`.

Optional:

- lazygit
- lazydocker

(you should use both, they are great)

### LSP

- Tailwind support
- Intelephense for php (best in class for Laravel development)

### Theme

- I concede, we are back to using catppuccin. There is just too many integrations.

## Troubleshooting

If opening a py file leads to pyright analyzing your whole library, make sure to add an empty `pyrightconfig.json` into the file root.
This can be your $HOME folder or for example on darwin using homebrew it could be `/opt/homebrew/`.
