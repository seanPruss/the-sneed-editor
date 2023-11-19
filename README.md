# The Sneed Editor

![The Sneed Editor.](./TheSneedEditor.png)

## My config of [LazyVim](https://github.com/LazyVim/LazyVim).

The sneed editor is nothing special. You could just as easily make it following  
the LazyVim documentation and Elijah Manor's YouTube videos. If you don't feel  
like configuring LazyVim yourself and want a kitchen sink approach to your editor  
like I do, this might be for you.

## `/config`

### `keymaps.lua`

Here I have set some keymaps from my nvim-config repo, based on ThePrimeagen's  
config.

| Keymap                                        | Action                                                              |
| --------------------------------------------- | ------------------------------------------------------------------- |
| `J`, `K` in visual mode                       | Moves block of text up or down                                      |
| `J` in normal mode                            | Appends line below to current line                                  |
| `<C-d>`, `<C-u>`                              | Still jumps by half a page, but cursor is centered                  |
| `n`                                           | Next item in search but keeps cursor in the middle                  |
| `<leader>p` when selecting text to paste over | Pastes without changing the paste buffer                            |
| `<C-c>`                                       | Maps to `<Esc>` if you're used to using `<C-c>` to exit insert mode |
| `Q`                                           | Does nothing instead of putting you in ex mode                      |
| `<leader>r`                                   | Replaces all instances of the word the cursor is on                 |
| `<leader>m`                                   | Make the current file executable                                    |

```lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })
vim.keymap.set("n", "<leader>m", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make executable" })
```

### `lazy.lua`

Just a kitchen sink of languages, formatters, and other stuff.  
Imported alpha so I could use alpha for the logo instead of dashboard

```lua
--Non-default imports
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.linting.eslint" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        { import = "lazyvim.plugins.extras.formatting.black" },
        { import = "lazyvim.plugins.extras.ui.alpha" },
        { import = "lazyvim.plugins.extras.dap.core" },
        { import = "lazyvim.plugins.extras.lang.java" },
        { import = "lazyvim.plugins.extras.lang.clangd" },
        { import = "lazyvim.plugins.extras.lang.python" },
        { import = "lazyvim.plugins.extras.lang.tailwind" },
        { import = "lazyvim.plugins.extras.lang.rust" },
        { import = "lazyvim.plugins.extras.lang.markdown" },
        { import = "lazyvim.plugins.extras.editor.symbols-outline" },
        { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
        { import = "lazyvim.plugins.extras.util.dot" },
```

### `options.lua`

Stuff like 4 space indenting, the path to the current file in the top right corner,  
incremental search, and a vertical line at 80 characters to be mindful of line  
length.

```lua
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
```

## `/plugins`

### `alpha.lua`

Displays the logo, change local variable `logo` to use a different logo.

```lua
return {
    "goolord/alpha-nvim",
    opts = function(_, opts)
        local logo = [[
████████╗██╗  ██╗███████╗    ███████╗███╗   ██╗███████╗███████╗██████╗     ███████╗██████╗ ██╗████████╗ ██████╗ ██████╗
╚══██╔══╝██║  ██║██╔════╝    ██╔════╝████╗  ██║██╔════╝██╔════╝██╔══██╗    ██╔════╝██╔══██╗██║╚══██╔══╝██╔═══██╗██╔══██╗
   ██║   ███████║█████╗      ███████╗██╔██╗ ██║█████╗  █████╗  ██║  ██║    █████╗  ██║  ██║██║   ██║   ██║   ██║██████╔╝
   ██║   ██╔══██║██╔══╝      ╚════██║██║╚██╗██║██╔══╝  ██╔══╝  ██║  ██║    ██╔══╝  ██║  ██║██║   ██║   ██║   ██║██╔══██╗
   ██║   ██║  ██║███████╗    ███████║██║ ╚████║███████╗███████╗██████╔╝    ███████╗██████╔╝██║   ██║   ╚██████╔╝██║  ██║
   ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝     ╚══════╝╚═════╝ ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
    ]]
        opts.section.header.val = vim.split(logo, "\n", { triempty = true })
    end,
}
```

### `autocomplete.lua`

Scroll through autocomplete options with tab.

```lua
return {
    -- Use <tab> for completion and snippets (supertab)
    -- first: disable default <tab> and <s-tab> behavior in LuaSnip
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            return {}
        end,
    },
    -- then: setup supertab in cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- this way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
    },
}
```

### `colorizer.lua`

Highlights names of colours with their respective colour.

```lua
return {
    "NvChad/nvim-colorizer.lua",
    opts = {
        user_default_options = {
            tailwind = true,
            css = true,
            css_fn = true,
        },
    },
}
```

### `theme.lua`

Use the wal.vim theme which matches nvim colours to your terminal.

```lua
return {

    { "dylanaraps/wal.vim" },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "wal",
        },
    },
}
```

### `treesitter.lua`

Ensures parsers not covered by the imports are installed.

```lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "bash",
                "css",
                "html",
                "javascript",
                "lua",
                "query",
                "regex",
                "vim",
                "yaml",
            })
        end,
    },
}
```

### `undotree.lua`

Use UndoTree, which lets you see all undos and revert/branch.

```lua
return {
    "mbbill/undotree",
    vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" }),
}
```

### `vimbegood.lua`

Use ThePrimeagen's plugin VimBeGood. Use the keymap `<leader>v` to launch.

```lua
return {
    "theprimeagen/vim-be-good",
    vim.keymap.set("n", "<leader>v", vim.cmd.VimBeGood, { desc = "Launch VimBeGood" }),
}
```
