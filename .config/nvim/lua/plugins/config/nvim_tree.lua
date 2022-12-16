require("nvim-tree").setup({
  sort_by = "extension",
  git = {
	enable = true,
	ignore = false,
  },
  view = {
    adaptive_size = true,
	float = {
	  enable = true,
	  quit_on_focus_loss = true,
	  open_win_config = {
		relative = "cursor",
		height = 15,
	  }
	},
  },
  renderer = {
    group_empty = true,
	icons = {
	  show = {
		git = true,
	  },
	},
  },
})
