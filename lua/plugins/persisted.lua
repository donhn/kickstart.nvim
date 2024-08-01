return {
  'olimorris/persisted.nvim',
  lazy = false, -- make sure the plugin is always loaded at startup
  config = {
    use_git_branch = true,
    ignored_branches = {
      '^master',
      '^main',
    },
  },
}
