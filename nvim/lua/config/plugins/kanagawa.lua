return {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Load immediately
    opts = {
        -- Optional configuration
        theme = "wave", -- "wave" (default), "dragon", or "lotus"
        background = { light = "lotus", dark = "wave" },
    },
    config = function()
        vim.cmd("colorscheme kanagawa")
    end,
}
