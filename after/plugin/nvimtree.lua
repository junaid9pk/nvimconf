require("nvim-tree").setup{
  view = {
    number = true,
    relativenumber = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 1000,
  }

}
