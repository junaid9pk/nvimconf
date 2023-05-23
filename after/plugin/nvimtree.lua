require("nvim-tree").setup{
  view = {
    number = true,
    relativenumber = true,
  },
  filters = {
    dotfiles = false,
    git_clean = false,
  }
}
