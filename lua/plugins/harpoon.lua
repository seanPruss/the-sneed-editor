return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon"):list():append()
            end,
            desc = "Add to Harpoon list",
        },
        {
            "<leader>h",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "Show Harpoon list",
        },
        {
            "<C-h>",
            function()
                require("harpoon"):list():select(1)
            end,
        },
        {
            "<C-j>",
            function()
                require("harpoon"):list():select(2)
            end,
        },
        {
            "<C-k>",
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
