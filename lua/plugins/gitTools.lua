return {
    {
        "tpope/vim-fugitive"
    },

    {
        "lewis6991/gitsigns.nvim",

        config = function()
            require("gitsigns").setup()

            vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_line_blame<CR>")
            vim.keymap.set("n", "<leader>gp", ":Gitsigns previes_hunk<CR>", {})
        end
    }

}
