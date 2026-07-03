require('rose-pine').setup({
	--- @usage 'main' | 'moon'
    variant = "auto",
    dark_variant = "moon",

    styles = {
        italic = false,
        bold = true,
    },

    highlight_groups = {
        -- bg-only: no `fg` so treesitter/syntax colors still show through
        -- the tint. blend is rose-pine's own mix toward `palette.base`
        -- (higher = closer to the full accent color), not nvim's native
        -- float-only blend.
        DiffAdd = { bg = "foam", blend = 35 },
        DiffDelete = { bg = "love", blend = 35 },
        DiffChange = { bg = "rose", blend = 35 },
        DiffText = { bg = "gold", blend = 55 },
    },

    before_highlight = function(group, highlight, palette)
        if vim.o.background == 'dark' then
            if group == 'Normal' or group == 'NormalFloat' then
                highlight.bg = 'NONE'
            end
        end
    end,

    palette = {
        dawn = {
            base = "#fdf8f4",
        },
    },

})

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')
