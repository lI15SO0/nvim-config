local settings = {}

settings.g = {
	mapleader = "`",
}

settings.o = {
	encoding = "utf-8",
	autoread = true,
	title = true,
	backup = false,
	swapfile = false,
	termguicolors = true,
	-- 设定在无操作时，交换文件刷写到磁盘的等待毫秒数（默认为 4000）
	updatetime = 10,
	-- 设定等待按键时长的毫秒数
	timeoutlen = 500,
	hidden = true,
	-- 鼠标支持
	mouse = 'a',
	-- 是否启用系统剪切板
	clipboard = "unnamedplus",
	-- 是否开启命令行补全
	wildmenu = true,
	-- 是否开启在搜索时如果有大写字母，则关闭忽略大小写的选项
	ignorecase = true,
	smartcase = true,
	-- 拼写检查
	spell = true,
	spelllang = "en_us,cjk",

	-- ####################### UI PART #########################
	-- 是否高亮当前文本行
	cursorline = true,
	cursorcolumn = true,
	-- 行号
	number = true,
	relativenumber = true,
	-- 是否在屏幕最后一行显示命令
	showcmd = true,
	-- 设定光标上下两侧最少保留的屏幕行数
	scrolloff = 15,
	-- 是否开启语法高亮
	syntax = "enable",
	-- 是否特殊显示空格等字符
	list = true,
	-- 自动缩进
	autoindent = true,
	filetype = "plugin",
	-- 是否开启高亮搜索
	hlsearch = true,
	-- 是否在插入括号时短暂跳转到另一半括号上
	showmatch = false,
	-- 代码折叠
	foldenable = true,
	foldmethod = "expr",
	foldexpr = 'nvim_treesitter#foldexpr()',
	foldlevel = 100,
	-- 指定 tab 的长度
	tabstop = 4,
	softtabstop = 4,
	shiftwidth=4,
	smarttab = true,
	shiftround = true,
	wrap = false,
	exrc = true,
	showmode = false,
}

settings.bo = {
	shiftwidth = 4,
}

for prefix, tbl in pairs(settings) do
	for key, value in pairs(tbl) do
		vim[prefix][ key ] = value
	end
end

return settings
