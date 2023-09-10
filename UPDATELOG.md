# UPDATE LOG

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
