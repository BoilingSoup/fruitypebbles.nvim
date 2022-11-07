for k in pairs(package.loaded) do
	if k:match(".*fruitypebbles.*") then
		package.loaded[k] = nil
	end
end

require("fruitypebbles").setup({
	style = "deep",
	transparent = true,
	colors = {
		red = "#EA4444",
		yellow = "#FFFF00",
		blue = "#52B9FF",
		sky_blue = "#07CDDF",
		purple = "#722099",
		lime = "#51E800",
		cyan = "#00FFD5",
		orange = "#FCB103",
		faint_green = "#9ABF8E",
		faint_orange = "#E0Ca67",
		numbers_blue = "#78D0EB",
		royal_blue = "#0044B3",
	},
	highlights = {
		["@boolean"] = { fg = "$red" },
		["@comment"] = { fg = "$purple" },
		["@conditional"] = { fg = "$red" },
		["@constant"] = { fg = "$yellow" },
		["@constant.builtin"] = { fg = "$orange" },
		["@constant.macro"] = { fg = "$orange" },
		["@constructor"] = { fg = "$sky_blue" },
		["@error"] = { fg = "$yellow" },
		["@exception"] = { fg = "$yellow" },
		["@float"] = { fg = "$numbers_blue" },
		["@function"] = { fg = "$lime" },
		["@function.builtin"] = { fg = "$lime" },
		["@function.macro"] = { fg = "$lime" },
		["@include"] = { fg = "$orange" },
		["@keyword"] = { fg = "$red" },
		["@keyword.function"] = { fg = "$red" },
		["@keyword.operator"] = { fg = "$orange" },
		["@method"] = { fg = "$lime" },
		["@namespace"] = { fg = "$orange" },
		["@number"] = { fg = "$numbers_blue" },
		["@operator"] = { fg = "$faint_orange" },
		["@parameter"] = { fg = "$cyan" },
		["@punctuation.delimiter"] = { fg = "$faint_orange" },
		["@punctuation.bracket"] = { fg = "$faint_orange" },
		["@punctuation.special"] = { fg = "$faint_orange" },
		["@string"] = { fg = "$faint_green" },
		["@tag"] = { fg = "$orange" },
		["@tag.delimiter"] = { fg = "$red" },
		["@type"] = { fg = "$sky_blue" },
		["@type.builtin"] = { fg = "$red" },
		["@variable"] = { fg = "$cyan" },
		["@variable.builtin"] = { fg = "$sky_blue" },
	},
})
require("fruitypebbles").colorscheme()