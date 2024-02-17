return {
    "m4xshen/hardtime.nvim",
    event = "BufReadPre",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    disabled_filetypes = { "qf", "netrw", "neo-tree", "lazy", "mason", "oil", "harpoon-menu" },
}
