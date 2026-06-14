require('rose-pine').setup({
	--- @usage 'main' | 'moon'
    variant = "auto",
    dark_variant = "moon",

    styles = {
        italic = false,
        bold = true,
    },

    highlight_groups = {
        DiffAdd = { bg = "foam", fg = "base", blend = 90 },
        DiffDelete = { bg = "love", fg = "base", blend = 90 },
        DiffChange = { bg = "iris", fg = "base", blend = 92 },
        DiffText = { bg = "gold", fg = "base", blend = 85 },

        GitSignsAdd = { fg = "foam" },
        GitSignsDelete = { fg = "love" },
        GitSignsChange = { fg = "iris" },

        -- Optional: used by some GitSigns features
        GitSignsChangedelete = { fg = "gold" },
        GitSignsTopdelete = { fg = "love" },
        GitSignsUntracked = { fg = "foam" },
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
