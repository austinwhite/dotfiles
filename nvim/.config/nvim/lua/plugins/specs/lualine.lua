return {
       'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = "VeryLazy",
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {"alpha", "NvimTree", "ministarter"},
                        winbar = {"alpha", "NvimTree", "ministarter"},
                    },
                },
                winbar = {
                    lualine_a = {"buffers"},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
            })
        end,
}
