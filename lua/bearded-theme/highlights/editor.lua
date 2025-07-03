local M = {}

---@param colors BeardedColors
---@param config? BeardedConfig
function M.setup(colors, config)
    config = config or require("bearded-theme").config
    local theme = colors.theme

    local highlights = {
        -- Editor basics
        Normal = { fg = theme.ui.fg, bg = config.transparent and "NONE" or theme.ui.bg },
        NormalNC = config.dimInactive and { fg = theme.ui.fg_dim, bg = config.transparent and "NONE" or theme.ui.bg_dim } or { link = "Normal" },
        NormalFloat = { fg = theme.ui.float.fg, bg = config.transparent and "NONE" or theme.ui.float.bg },
        
        -- Cursor
        Cursor = { fg = theme.ui.bg, bg = theme.syn.keyword },
        CursorIM = { fg = theme.ui.bg, bg = theme.syn.keyword },
        CursorColumn = { bg = theme.ui.bg_p1 },
        CursorLine = { bg = theme.ui.bg_p1 },
        CursorLineNr = { fg = theme.ui.special, bg = theme.ui.bg_gutter, bold = true },
        
        -- Line numbers
        LineNr = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
        SignColumn = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
        FoldColumn = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
        
        -- Columns and splits
        ColorColumn = { bg = theme.ui.bg_p1 },
        VertSplit = { fg = theme.ui.float.fg_border },
        WinSeparator = { fg = theme.ui.float.fg_border },
        
        -- Folding
        Folded = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
        
        -- Search
        Search = { fg = theme.ui.bg, bg = theme.syn.keyword },
        IncSearch = { fg = theme.ui.bg, bg = theme.syn.keyword },
        CurSearch = { link = "IncSearch" },
        
        -- Selection
        Visual = { bg = theme.ui.bg_visual },
        VisualNOS = { bg = theme.ui.bg_visual },
        
        -- Diff
        DiffAdd = { fg = theme.vcs.added, bg = theme.diff.add },
        DiffChange = { fg = theme.vcs.changed, bg = theme.diff.change },
        DiffDelete = { fg = theme.vcs.removed, bg = theme.diff.delete },
        DiffText = { fg = theme.vcs.changed, bg = theme.diff.text },
        
        -- Popup menu
        Pmenu = { fg = theme.ui.pmenu.fg, bg = theme.ui.pmenu.bg },
        PmenuSel = { fg = theme.ui.pmenu.fg_sel, bg = theme.ui.pmenu.bg_sel },
        PmenuSbar = { bg = theme.ui.pmenu.bg_sbar },
        PmenuThumb = { bg = theme.ui.pmenu.bg_thumb },
        
        -- Statusline
        StatusLine = { fg = theme.ui.fg, bg = theme.ui.bg_p1 },
        StatusLineNC = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
        
        -- Tabline
        TabLine = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
        TabLineFill = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
        TabLineSel = { fg = theme.ui.fg, bg = theme.ui.bg },
        
        -- Misc
        Conceal = { fg = theme.ui.nontext },
        Directory = { fg = theme.syn.fun },
        EndOfBuffer = { fg = theme.ui.bg },
        ErrorMsg = { fg = theme.diag.error },
        MoreMsg = { fg = theme.diag.info },
        ModeMsg = { fg = theme.diag.info },
        NonText = { fg = theme.ui.nontext },
        Question = { fg = theme.diag.info },
        QuickFixLine = { bg = theme.ui.bg_search },
        SpecialKey = { fg = theme.ui.special },
        Title = { fg = theme.syn.fun, bold = true },
        WarningMsg = { fg = theme.diag.warning },
        Whitespace = { fg = theme.ui.whitespace },
        WildMenu = { fg = theme.ui.fg, bg = theme.ui.bg_search },
        
        -- Spelling
        SpellBad = { fg = theme.diag.error, undercurl = config.undercurl },
        SpellCap = { fg = theme.diag.warning, undercurl = config.undercurl },
        SpellLocal = { fg = theme.diag.info, undercurl = config.undercurl },
        SpellRare = { fg = theme.diag.hint, undercurl = config.undercurl },
        
        -- Floating windows
        FloatBorder = { fg = theme.ui.float.fg_border, bg = config.transparent and "NONE" or theme.ui.float.bg_border },
        FloatTitle = { fg = theme.ui.special, bg = config.transparent and "NONE" or theme.ui.float.bg_border },
        
        -- Window picker
        WindowPickerStatusLine = { fg = theme.ui.special, bg = theme.ui.bg_p1, bold = true },
        WindowPickerStatusLineNC = { fg = theme.ui.special, bg = theme.ui.bg_p1, bold = true },
        WindowPickerWinBar = { fg = theme.ui.special, bg = theme.ui.bg_p1, bold = true },
        WindowPickerWinBarNC = { fg = theme.ui.special, bg = theme.ui.bg_p1, bold = true },
        
        -- Messages
        MsgArea = { fg = theme.ui.fg_dim },
        MsgSeparator = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
    }

    return highlights
end

return M
