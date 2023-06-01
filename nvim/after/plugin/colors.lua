require('rose-pine').setup({
    -- For no background (doesn't work on Mac): disable_background = true
})

function ColorMyPencils(color) 
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- For no background (doesn't work on Mac): vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- For no background (doesn't work on Mac): vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
