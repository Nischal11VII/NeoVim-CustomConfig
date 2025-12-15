return
{
  
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",

        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({

                auto_install = true,
                ensure_installed = { "cpp", "python", "lua", "javascript", "html", "css" },
                highlight = {
                    enable = true,
                },

                intent = {
                    enable = true,
                },
 --               fold = {
 --                   enable = true,
--                  disable = {},
 --               },

            })
--            vim.api.nvim_set_keymap('n', 'zc', ':foldclose<CR>', { noremap = true, silent = true })
--            vim.api.nvim_set_keymap('n', 'zo', ':foldopen<CR>', { noremap = true, silent = true })
--            vim.api.nvim_set_keymap('n', 'zM', ':foldclose<CR>', { noremap = true, silent = true })  -- Fold all
--            vim.api.nvim_set_keymap('n', 'zR', ':foldopen<CR>', { noremap = true, silent = true })   -- Unfold all
        end
    }
}
