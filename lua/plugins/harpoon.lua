return {
    "theprimeagen/harpoon",
    keys = {
        { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Add to Harpoon list" },
        { "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Show Harpoon list" },
        { "<C-y>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" },
        { "<C-u>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" },
        { "<C-i>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>" },
        { "<C-o>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>" },
    },
}
