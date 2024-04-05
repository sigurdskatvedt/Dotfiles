function ColorMyPencils(color) 
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	-- For no background (doesn't work on Mac): vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- For no background (doesn't work on Mac): vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
