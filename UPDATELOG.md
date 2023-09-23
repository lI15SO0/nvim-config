# UPDATE LOG

## 2023-09-23

---

[CHANGE] ./lua/core/options.lua:
- ADD 7-12: Add lspconfig control method (now can config lsp on .nvim.lua file.).

[CHANGE] ./lua/api/tbl.lua:
- ADD 10-12: nil check
- DEL 16, 17, 19; ADD 20: make function more stable.

[CHANGE] ./lua/plugins/completion/nvim-cmp.lua:
- DEL 16, 57-65: remove no use line.
- DEL 25, 31, 120-127: remove lspkind plugins(it only provided icons, but icon not useful in cmp list.).
- ANNOTATION 20, 39-45: disable spell source

[CHANGE] ./lua/plugins/lsp/lspconfig.lua:
- DEL 11: remove no use line.
- ANNOTATION 37:
- ADD 38: use vim.lsp.buf.hover to replace lspsaga's hover doc(cause vim apis' hover page more simple.).
- DEL 51: remove lspsaga outline func(cause this func not useful). 
- ADD 75-89, 93-144: Support auto or half/full manully method to config LSP.

[CHANGE] ./lua/plugins/view/undotree.lua:
- CHANGE 11: move key bind from "<leader>3" to "<leader>2" (cause outline no longer bind in <leader>2).

[ADD] ./snippets/rust.json

---

## 2023-09-20

---

[CHANGE] ./lua/core/mapping.lua:
- ADD 97-110: Add 2 Key bind to move line up/down.

[CHANGE] ./lua/editor/telescope.lua:
- CHANGE 10: Change build tool from make to cmake.

[CHANGE] ./lua/api/init.lua:
- ADD 13: Add new function.

[ADD] ./lua/api/tbl.lua: some function for tbl.

[CHANGE] ./lua/api/path.lua:
- DEL 11~23: delete no use function.

---

## 2023-09-19

---

[CHANGE] ./lua/autocmd/autosave.lua:
- DEL 3: Make saved message not show up.

[CHANGE] ./lua/plugins/lsp/neodev.lua: 
- ADD 17: Make luapad more stable.

[CHANGE] ./lua/plugins/view/alpha.lua:
- DEL 22~25: remove fortune. 


[CHANGE] ./lua/plugins/view/nvim-notify.lua:
- CHANGE 9: make notify shorter.

[CHANGE] ./lua/plugins/view/undotree.lua:
- FORMAT 19-21, 27

[PERF] Make nvim boot up faster.
    [CHANGE] ./lua/plugins/dap/dap.lua: CHANGE 8
    [CHANGE] ./lua/plugins/editor/switch.lua: CHANGE 10
    [CHANGE] ./lua/plugins/editor/flash.lua: DEL 3
    [CHANGE] ./lua/plugins/editor/mini.lua: CHANGE 4
    [CHANGE] ./lua/plugins/editor/window-picker.lua: DEL 1~2, 6 ; MOVE 19-31 to 4-15
    [CHANGE] ./lua/plugins/lsp/lspconfig.lua: CHANGE 11, 17, 69 ; ADD 64
    [CHANGE] ./lua/plugins/lsp/lspui.lua: CHANGE 6
    [CHANGE] ./lua/plugins/lsp/neodev.lua: CHANGE 5
    [CHANGE] ./lua/plugins/view/aerial.lua: MOVE 14-18 to 5-9
    [CHANGE] ./lua/plugins/view/ui.lua: CHANGE 56

---

## 2023-09-18

---

[CHANGE] ./lua/commands/Bufdel.lua:
- ADD 1-6: add annotation

[CHANGE] ./lua/commands/MakeDirectory.lua:
- ADD 1-6: add annotation

[CHANGE] ./lua/core/options.lua:
- ADD 21: Add "options.blend" to control float window's transparency.

[CHANGE] ./lua/plugins/completion/nvim-cmp.lua:
- ADD 151-153: Add custom command "EditSnip" when using vsnip or luasnip engine.

[CHANGE] ./lua/plugins/completion/snip.lua:
- CHANGE 49: Format code.
- CHANGE 60-62: config snippy engine's snippet dir.
- ADD 150-167: Add code to registe custom command "EditSnip".

[CHANGE] ./lua/plugins/view/fterm.lua:
- CHANGE 17: Change blend to options.blend for a easy way to control options.

---

## 2023-09-17

---

[CHANGE] ./lua/core/mapping.lua:
- CHANGE 37, 163, 170, 177, 184: Change ':' to '<cmd>'

---

## 2023-09-13

---

[CHANGE] lua/plugins/completion/nvim-cmp.lua:
- DELETE 21, 44: remove :crates" plugin

[CHANGE] lua/plugins/editor/init.lua:
- DELETE 12: disable "insx" plugin (Cause: mini.splitjoin)

[ADD] lua/plugins/editor/text-transform.lua
[CHANGE] lua/plugins/editor/init.lua:
- ADD 12: Add new plugins "text-transform"

---

## 2023-09-12

---

[CHANGE] lua/autocmd/autosave.lua:
- CHANGE 2: change "wall" to "w". 

[CHANGE] lua/autocmd/init.lua:
- ADD 13: add "nested" to autosave.
- ADD [13, 18, 23]: add autocmd descriptions.

---

## 2023-09-10

---

[CHANGE] README.md:
- ADD 15-18: Add clone command.
- CHANGE 21: Corrected bold style.

[CHANGE] init.lua:
- CHANGE 1-9: Use safeloader to load modules.
- ADD 7-8: New two modules about customize commands and autocmd.

[CHANGE] lua/api/init.lua:
- ADD 8-12: Add new apis about customize and safe load.

[CHANGE] lua/api/pluginLoader.lua:
- CHANGE 6: Auto code format.
- CHANGE 10-11: More detils warn.

[ADD] lua/autocmd/DisableNewLineExpression.lua

[ADD] lua/autocmd/autosave.lua

[ADD] lua/autocmd/init.lua

[ADD] lua/autocmd/lastplace.lua

[ADD] lua/commands/Bufdel.lua

[ADD] lua/commands/MakeDirectory.lua

[ADD] lua/commands/init.lua

[CHANGE] lua/core/mapping.lua:
- CHANGE 156: Use a custom command to delete buffer.

[CHANGE] core/settings.lua:
- DELETE 47~48: delete filttype settings
- ADD 68: set "signcolumn" to "yes" for always show sign column

[DELETE] lua/plugins/editor/auto-save.lua: Use autocmd to replace auto-save plugins.

[CHANGE] lua/plugins/editor/editor.lua:
- DELETE 2-5: Use autocmd to replace nvim-lastplace plugins.
- DELETE 18-23: Use custom command replace bufdelete.nvim plugins.

[CHANGE] lua/plugins/editor/init.lua:
- DELETE 7: Delete auto-save from plugins load table.
- ADD 12: Add new plugins "insx".

[ADD] lua/plugins/editor/insx.lua: new plugins insx.

[CHANGE] lua/plugins/lsp/init.lua:
- ADD 7: Make neodev use a stand alone file.

[CHANGE] lua/plugins/lsp/lspconfig.lua:
- DELETE 8: Make neodev use a stand alone file.

[ADD] lua/plugins/lsp/neodev.lua: move neodev plugins here, add new plugins luapad.

[ADD] plugins/view/gitsigns.lua: move gitsigns plugins here.

[CHANGE] plugnis/view/init.lua:
- ADD 15: make gitsigns.lua load.

[CHANGE] plugins/view/ui.lua
- DELETE 2~6: take gitsigns's config out of ui.lua

[CHANGE] snippets/lua.json:
- ADD 13-25: new lua modules snippet.

---

## 2023-09-04

First commit: just split from lI15SO0/mydotfiles.

---
