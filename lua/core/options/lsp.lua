local obj = {}

-- lsp.manual possible value: "full", "true", "false"
obj.manual = "false"
obj.config = {
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				hint = {
					enable = true,
					arrayIndex = "Enable",
					setType = true,
				}
			}
		}
	}
}
obj.configed = {}

return obj
