local harpoon = require("harpoon")
return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    keys = {
        {
            "<leader>a",
            function()
                harpoon:list():append()
            end,
            desc = "Add to Harpoon list",
        },
        {
            "<leader>h",
            function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Show Harpoon list",
        },
        {
            "<C-h>",
            function()
                harpoon:list():select(1)
            end,
        },
        {
            "<C-j>",
            function()
                harpoon:list():select(2)
            end,
        },
        {
            "<C-k>",
            function()
                harpoon:list():select(3)
            end,
        },
        {
            "<C-l>",
            function()
                harpoon:list():select(4)
            end,
        },
        {
            "<C-S-P>",
            function()
                harpoon:list():prev()
            end,
        },
        {
            "<C-S-N>",
            function()
                harpoon:list():next()
            end,
        },
    },
}
