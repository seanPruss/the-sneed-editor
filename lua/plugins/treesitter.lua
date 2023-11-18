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
