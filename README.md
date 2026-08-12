# nvim-config

---

## About

This is my personal nvim configure files.

It was configured by a minimul way. To use this configuration, make sure you read all key settings first.

---

## Feature

Use "< Space >" key enter command mod, double hit "< Space >" key to commit command.

Use <`> as <Leader> key.

Provide apis for configure nvim-config and workspace exrc.

Use key hit event and autocmd to lazy load plugins. These function provided by api.

Use vim.pack to install & upgrade plugins.

---

## Usage

**!!Make sure you termemu support OSC 52!!**

Ensure tree-sitter-cli installed first.

Clone it in to nvim configure dir.

```bash
git clone https://codeberg.org/lI15SO0/nvim-config ~/.config/nvim --depth=1
```

Open nvim once to install plugins.

> telescope.nvim
> This configure use telescope-fzf to provide telescope search, make sure you had install cmake or just delete telescope-fzf's configuron you path or just delete telescope-fzf's configure.

> luasnip
> Ensure luasnip install jsregexp. Can get more message at :checkhealth

---

## Thanks to 

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
