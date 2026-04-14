return {
	"hrsh7th/nvim-cmp",
	-- @param opts cmp.ConfigSchema
	opts = function(_, opts)
		opts.completion = {
			autocomplete = false,
		}
	end,
}
