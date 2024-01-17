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
            "<C-p>",
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
