local api = require("api")
local obj = {}

obj.lint_directory = api.path.join(vim.fn.stdpath("config"), "lint")

return obj
