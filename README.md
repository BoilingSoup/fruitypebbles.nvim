# fruitypebbles
![image](https://user-images.githubusercontent.com/84747244/200152262-55e1f7e4-1ddf-4fbb-9934-45fe49a64142.png)

![image](https://user-images.githubusercontent.com/84747244/200151835-64c859de-315f-4418-8310-6d7042d6b987.png)


<h4><div align="right">
    <a href="#installation">Installation</a>
    <span> | </span>
    <a href="#default-configuration">Configuration</a>
    <span> | </span>
    <a href="#customization">Customization</a>
    <span> &nbsp;&nbsp;&nbsp; &nbsp; </span>
</div></h4>

_For latest [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight, upgraded to Neovim 0.8.0 or later built with tree-sitter 0.20.3+_

### Features

- Vibrant high contrast colors to remind you of cereal
- Supporting multiple plugins with hand picked proper colors
- Customize `Colors`, `Highlights` and `Code style` of the theme as you like (Refer [Customization](#customization))
- Toggle the theme style without exiting Neovim using `toggle_style_key` (Refer [Config](#default-configuration))

## Installation

Install via your favourite package manager

```vim
" Using Vim-Plug
Plug 'BoilingSoup/fruitypebbles.nvim'
```

```lua
-- Using Packer
use 'BoilingSoup/fruitypebbles.nvim'
```

## Configuration

### Enable theme

```lua
-- Lua
require('fruitypebbles').load()
```

```vim
" Vim
colorscheme fruitypebbles
```

### Change default style

```lua
-- Lua
require('fruitypebbles').setup {
    style = 'darker'
}
require('fruitypebbles').load()
```

```vim
" Vim
let g:fruitypebbles_config = {
    \ 'style': 'darker',
\}
colorscheme fruitypebbles
```

> **Options:** dark, darker, cool, deep, warm, warmer, light

## Default Configuration

```lua
-- Lua
require('fruitypebbles').setup  {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
```

### Vimscript configuration

Fruitypebbles can be configured also with Vimscript, using the global dictionary `g:fruitypebbles_config`.
**NOTE**: when setting boolean values use `v:true` and `v:false` instead of 0 and 1

Example:

```vim
let g:fruitypebbles_config = {
  \ 'style': 'deep',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:true,
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false,
  \ },
\ }
colorscheme fruitypebbles
```

## Customization

Example custom colors and Highlights config

```lua
require('fruitypebbles').setup {
  colors = {
    bright_orange = "#ff8800",    -- define a new color
    green = '#00ffaa',            -- redefine an existing color
  },
  highlights = {
    ["@keyword"] = {fg = '$green'},
    ["@string"] = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    ["@function"] = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
    ["@function.builtin"] = {fg = '#0059ff'}
  }
}
```

Note that TreeSitter keywords have been changed after neovim version 0.8 and onwards.
TS prefix is trimmed and lowercase words should be used separated with '.'

The old way before neovim 0.8 looks like this.
For all keywords see [this](https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/highlights.lua#L133-L257) file from line 133 to 257

```lua
require('fruitypebbles').setup {
  colors = {
    bright_orange = "#ff8800",    -- define a new color
    green = '#00ffaa',            -- redefine an existing color
  },
  highlights = {
    TSKeyword = {fg = '$green'},
    TSString = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    TSFunction = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
    TSFuncBuiltin = {fg = '#0059ff'}
  }
}
```

## Plugins Configuration

### Enable lualine

To Enable the `fruitypebbles` theme for `Lualine`, specify theme as `fruitypebbles`:

```lua
require('lualine').setup {
  options = {
    theme = 'fruitypebbles'
    -- ... your lualine config
  }
}
```

## Plugins Supported

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSPDiagnostics](https://neovim.io/doc/user/lsp.html)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [WhichKey](https://github.com/folke/which-key.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [GitGutter](https://github.com/airblade/vim-gitgutter)
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
- [VimFugitive](https://github.com/tpope/vim-fugitive)
- [DiffView](https://github.com/sindrets/diffview.nvim)
- [Hop](https://github.com/phaazon/hop.nvim)
- [Mini](https://github.com/echasnovski/mini.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Neotest](https://github.com/nvim-neotest/neotest)

## Reference

- [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim)
- [one-dark-theme](https://github.com/andresmichel/one-dark-theme)

## License

[MIT](https://choosealicense.com/licenses/mit/)
