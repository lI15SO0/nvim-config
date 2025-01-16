local obj = {}

obj = {}
obj.schema = {
	"#39E59E",
	"#F2C85A",
	"#F477F4",
	"#B97BF8",
	"#2563EB",
	"#0000AA",
	"#FFFF88"
}
obj.Error = obj.schema[3]
obj.Warning = obj.schema[2]
obj.Information = obj.schema[4]
obj.Info = obj.Information
obj.Hint = obj.schema[1]
obj.OK = obj.Hint
obj.Note = obj.schema[5]
obj.Hack = obj.schema[6]
obj.Label = obj.schema[7]

return obj
