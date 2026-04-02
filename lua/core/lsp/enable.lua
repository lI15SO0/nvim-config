local api = require('api')

local lsp_enable_dir = vim.fn.stdpath("config") .. "/lua/core/lsp/enable_lst"
local lsp_lst = api.fs.get_lua_name(lsp_enable_dir)

api.loader.safe_requires_with_prefix("core.lsp.enable_lst", lsp_lst)
