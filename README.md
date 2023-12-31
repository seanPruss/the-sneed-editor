# The Sneed Editor

## My config of [LazyVim](https://github.com/LazyVim/LazyVim)

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
        { import = "lazyvim.plugins.extras.dap.nlua" },
        { import = "lazyvim.plugins.extras.lang.java" },
        { import = "lazyvim.plugins.extras.lang.clangd" },
        { import = "lazyvim.plugins.extras.lang.python" },
        { import = "lazyvim.plugins.extras.lang.tailwind" },
        { import = "lazyvim.plugins.extras.lang.rust" },
        { import = "lazyvim.plugins.extras.lang.markdown" },
        { import = "lazyvim.plugins.extras.lang.docker" },
        { import = "lazyvim.plugins.extras.lang.go" },
        { import = "lazyvim.plugins.extras.lang.yaml" },
        { import = "lazyvim.plugins.extras.editor.symbols-outline" },
        { import = "lazyvim.plugins.extras.editor.leap" },
        { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
        { import = "lazyvim.plugins.extras.util.dot" },
        { import = "lazyvim.plugins.extras.lsp.none-ls" },
        { import = "lazyvim.plugins.extras.test.core" },
        { import = "lazyvim.plugins.extras.ui.mini-animate" },
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

### `folding.lua`

Plugins for code folding.

```lua
local foldIcon = ""
local hlgroup = "NonText"
local function foldTextFormatter(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = "  " .. foldIcon .. "  " .. tostring(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, hlgroup })
    return newVirtText
end

--------------------------------------------------------------------------------

return {
    {
        "chrisgrieser/nvim-origami",
        event = "BufReadPost", -- later will not save folds
        opts = true,
    },
    { -- UFO
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        event = "VimEnter", -- needed for folds to load in time and comments closed
        keys = {
            {
                "zm",
                function()
                    require("ufo").closeAllFolds()
                end,
                desc = " 󱃄 Close All Folds",
            },
            {
                "zk",
                function()
                    require("ufo").goPreviousClosedFold()
                end,
                desc = " 󱃄 Goto Prev Fold",
            },
            {
                "zj",
                function()
                    require("ufo").goNextClosedFold()
                end,
                desc = " 󱃄 Goto Next Fold",
            },
            {
                "zr",
                function()
                    require("ufo").openFoldsExceptKinds({ "comment", "imports" })
                end,
                desc = " 󱃄 Open All Folds",
            },
            {
                "z1",
                function()
                    require("ufo").closeFoldsWith(1)
                end,
                desc = " 󱃄 Close L1 Folds",
            },
            {
                "z2",
                function()
                    require("ufo").closeFoldsWith(2)
                end,
                desc = " 󱃄 Close L2 Folds",
            },
            {
                "z3",
                function()
                    require("ufo").closeFoldsWith(3)
                end,
                desc = " 󱃄 Close L3 Folds",
            },
            {
                "z4",
                function()
                    require("ufo").closeFoldsWith(4)
                end,
                desc = " 󱃄 Close L4 Folds",
            },
        },
        init = function()
            -- INFO fold commands usually change the foldlevel, which fixes folds, e.g.
            -- auto-closing them after leaving insert mode, however ufo does not seem to
            -- have equivalents for zr and zm because there is no saved fold level.
            -- Consequently, the vim-internal fold levels need to be disabled by setting
            -- them to 99
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99
        end,
        opts = {
            provider_selector = function(_, ft, _)
                -- INFO some filetypes only allow indent, some only LSP, some only
                -- treesitter. However, ufo only accepts two kinds as priority,
                -- therefore making this function necessary :/
                local lspWithOutFolding = { "markdown", "sh", "css", "html", "python" }
                if vim.tbl_contains(lspWithOutFolding, ft) then
                    return { "treesitter", "indent" }
                end
                return { "lsp", "indent" }
            end,
            -- when opening the buffer, close these fold kinds
            -- use `:UfoInspect` to get available fold kinds from the LSP
            close_fold_kinds = { "imports", "comment" },
            open_fold_hl_timeout = 800,
            fold_virt_text_handler = foldTextFormatter,
        },
    },
}
```

### `hardtime.lua`

Stops you from using bad habits like hjkl when you could do relative jumping  
and more.

```lua
return {
    "m4xshen/hardtime.nvim",
    event = "BufEnter",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    disabled_filetypes = { "qf", "netrw", "neotree", "lazy", "mason", "oil" },
}
```

### `harpoon.lua`

Quick navigation for frequently used files.

```lua
return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    keys = {
        {
            "<leader>ha",
            function()
                require("harpoon"):list():append()
            end,
            desc = "Append",
        },
        {
            "<leader>hl",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "List",
        },
        {
            "<C-h>",
            function()
                require("harpoon"):list():select(1)
            end,
        },
        {
            "<C-f>",
            function()
                require("harpoon"):list():select(2)
            end,
        },
        {
            "<C-s>",
            function()
                require("harpoon"):list():select(3)
            end,
        },
        {
            "<C-l>",
            function()
                require("harpoon"):list():select(4)
            end,
        },
        {
            "<C-S-P>",
            function()
                require("harpoon"):list():prev()
            end,
        },
        {
            "<C-S-N>",
            function()
                require("harpoon"):list():next()
            end,
        },
    },
}
```

### `oil.lua`

Opens a file explorer where you can add, rename, and delete files like lines in  
a vim buffer.

```lua
return {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "-", "<cmd>Oil<CR>" },
    },
}
```

### `theme.lua`

Uses rose-pine theme with a transparent background

```lua
return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            disable_background = true,
        },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine",
        },
    },
}
```

### `undotree.lua`

Use UndoTree, which lets you see all undos and revert/branch.

```lua
return {
    "mbbill/undotree",
    keys = {
        { "<leader>ct", "<cmd>UndotreeToggle<CR>", desc = "UndoTree" },
    },
}
```

### `vimbegood.lua`

Use ThePrimeagen's plugin VimBeGood. Use the keymap `<leader>v` to launch.

```lua
return {
    "theprimeagen/vim-be-good",
    keys = {
        { "<leader>v", "<cmd>VimBeGood<CR>", desc = "Launch VimBeGood" },
    },
}
```

### `whichkey.lua`

Add a harpoon category to whichkey.

```lua
return {
  "folke/which-key.nvim",
  optional = true,
  opts = {
    defaults = {
      ["<leader>h"] = { name = "+harpoon" },
    },
  },
}
```
