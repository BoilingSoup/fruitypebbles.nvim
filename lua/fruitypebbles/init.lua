local M = {}

M.styles_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }

---Change fruitypebbles option (vim.g.fruitypebbles_config.option)
---It can't be changed directly by modifing that field due to a Neovim lua bug with global variables (fruitypebbles_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
	local cfg = vim.g.fruitypebbles_config
	cfg[opt] = value
	vim.g.fruitypebbles_config = cfg
end

---Apply the colorscheme (same as ':colorscheme fruitypebbles')
function M.colorscheme()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "fruitypebbles"
	if vim.o.background == "light" then
		M.set_options("style", "light")
	elseif vim.g.fruitypebbles_config.style == "light" then
		M.set_options("style", "dark")
	end
	require("fruitypebbles.highlights").setup()
	require("fruitypebbles.terminal").setup()
end

---Toggle between fruitypebbles styles
function M.toggle()
	local index = vim.g.fruitypebbles_config.toggle_style_index + 1
	if index > #vim.g.fruitypebbles_config.toggle_style_list then
		index = 1
	end
	M.set_options("style", vim.g.fruitypebbles_config.toggle_style_list[index])
	M.set_options("toggle_style_index", index)
	if vim.g.fruitypebbles_config.style == "light" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
	vim.api.nvim_command("colorscheme fruitypebbles")
end

local default_config = {
	-- Main options --
	style = "dark", -- choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	toggle_style_key = nil,
	toggle_style_list = M.styles_list,
	transparent = false, -- don't set background
	term_colors = true, -- if true enable the terminal
	ending_tildes = false, -- show the end-of-buffer tildes
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- Changing Formats --
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- center bar (c) transparency
	},

	-- Custom Highlights --
	-- colors = {}, -- Override default colors
	-- highlights = {}, -- Override highlight groups

	-- Plugins Related --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl for diagnostics
		background = true, -- use background color for virtual text
	},
}

---Setup fruitypebbles.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
	if not vim.g.fruitypebbles_config or not vim.g.fruitypebbles_config.loaded then -- if it's the first time setup() is called
		vim.g.fruitypebbles_config = vim.tbl_deep_extend("keep", vim.g.fruitypebbles_config or {}, default_config)
		M.set_options("loaded", true)
		M.set_options("toggle_style_index", 0)
	end
	if opts then
		vim.g.fruitypebbles_config = vim.tbl_deep_extend("force", vim.g.fruitypebbles_config, opts)
		if opts.toggle_style_list then -- this table cannot be extended, it has to be replaced
			M.set_options("toggle_style_list", opts.toggle_style_list)
		end
	end
	if vim.g.fruitypebbles_config.toggle_style_key then
		vim.api.nvim_set_keymap(
			"n",
			vim.g.fruitypebbles_config.toggle_style_key,
			'<cmd>lua require("fruitypebbles").toggle()<cr>',
			{ noremap = true, silent = true }
		)
	end
end

function M.load()
	vim.api.nvim_command("colorscheme fruitypebbles")
end

return M
