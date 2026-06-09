require('rose-pine').setup({
	--- @usage 'main' | 'moon'
    variant = "auto",
    dark_variant = "moon",

    styles = {
        italic = false,
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

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'background subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' },
        DiagnosticWarn = { bg = 'gold', blend=50 },
        DiagnosticUnderlineError = { bg = 'love', blend = 10, undercurl = false },
        DiagnosticUnderlineWarn = { bg = 'gold', blend = 10, undercurl = false },
        DiagnosticUnderlineInfo = { bg = 'foam', blend = 10, undercurl = false },
        DiagnosticUnderlineHint = { bg = 'iris', blend = 10, undercurl = false }
	}
})

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')
