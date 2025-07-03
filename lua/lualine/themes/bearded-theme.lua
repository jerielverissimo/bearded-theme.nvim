local theme = require("bearded-theme.colors").setup().theme

local bearded = {}

bearded.normal = {
  a = { bg = theme.syn.fun, fg = theme.ui.bg },
  b = { bg = theme.ui.bg_p1, fg = theme.syn.fun },
  c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
}

bearded.insert = {
  a = { bg = theme.vcs.added, fg = theme.ui.bg },
  b = { bg = theme.ui.bg_p1, fg = theme.vcs.added },
}

bearded.command = {
  a = { bg = theme.syn.keyword, fg = theme.ui.bg },
  b = { bg = theme.ui.bg_p1, fg = theme.syn.keyword },
}

bearded.visual = {
  a = { bg = theme.syn.special2, fg = theme.ui.bg },
  b = { bg = theme.ui.bg_p1, fg = theme.syn.special2 },
}

bearded.replace = {
  a = { bg = theme.diag.error, fg = theme.ui.bg },
  b = { bg = theme.ui.bg_p1, fg = theme.diag.error },
}

bearded.inactive = {
  a = { bg = theme.ui.bg_dim, fg = theme.ui.fg_dim },
  b = { bg = theme.ui.bg_dim, fg = theme.ui.fg_dim, gui = "bold" },
  c = { bg = theme.ui.bg_dim, fg = theme.ui.fg_dim },
}

if vim.g.bearded_lualine_bold then
  for _, mode in pairs(bearded) do
    mode.a.gui = "bold"
  end
end

return bearded
