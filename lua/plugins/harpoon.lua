return {
    "theprimeagen/harpoon",
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon.mark").add_file()
            end,
            desc = "Add to Harpoon list",
        },
        {
            "<leader>h",
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            desc = "Show Harpoon list",
        },
        {
            "<C-h>",
            function()
                require("harpoon.ui").nav_file(1)
            end,
        },
        {
            "<C-j>",
            function()
                require("harpoon.ui").nav_file(2)
            end,
        },
        {
            "<C-k>",
            function()
                require("harpoon.ui").nav_file(3)
            end,
        },
        {
            "<C-l>",
            function()
                require("harpoon.ui").nav_file(4)
            end,
        },
    },
}
