---@class PaletteColors
local palette = {
    -- Base colors
    bg = "#141417",
    bg_dark = "#0f0f11",
    bg_light = "#1a1a1e",
    bg_lighter = "#202025",
    bg_float = "#202025",
    border = "#060607",
    
    -- Grays
    gray1 = "#373741",  -- matches editorLineNumber.foreground from tmp.json
    gray2 = "#aaaab3",
    gray3 = "#c5c5cb",
    gray4 = "#8a8a8f",
    
    -- Foreground
    fg = "#c5c5cb",
    fg_dim = "#aaaab3",
    fg_bright = "#ffffff",
    
    -- Accent colors
    blue = "#28A9FF",
    green = "#42DD76",
    yellow = "#FFB638",
    orange = "#FF7135",
    red = "#D62C2C",
    purple = "#A95EFF",
    magenta = "#E66DFF",
    pink = "#FF478D",
    cyan = "#14E5D4",
    
    -- Bright terminal colors to match tmp.json
    bright_black = "#42424a",
    bright_red = "#fc0606",
    bright_green = "#21fe6b",
    bright_yellow = "#ffb638",
    bright_blue = "#28a9ff",
    bright_magenta = "#e66dff",
    bright_cyan = "#00f9e5",
    bright_white = "#fbfbfb",
    
    -- Selection and search colors (based on #aaaaaa with opacity equivalents)
    selection = "#aaaaaa",  -- base selection color
    search = "#aaaaaa",     -- base search color  
    visual = "#aaaaaa",     -- base visual color
    
    -- Semantic colors
    error = "#D62C2C",
    warning = "#FFB638",
    info = "#28A9FF",
    hint = "#14E5D4",
    ok = "#42DD76",
    
    -- Git colors
    git_add = "#42DD76",
    git_change = "#28A9FF",
    git_delete = "#D62C2C",
    
    -- Diff colors
    diff_add = "#2fb85e",
    diff_change = "#2088cc",
    diff_delete = "#b51515",
    diff_text = "#2088cc",
    
    -- Special
    none = "NONE",
}

local M = {}

--- Generate colors table
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("bearded-theme").config.colors
    local theme = opts.theme or require("bearded-theme")._CURRENT_THEME

    if not theme then
        error("bearded-theme.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme bearded-theme'")
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("bearded-theme.themes")[theme](updated_palette_colors)

    -- Add to and/or override theme_colors
    local theme_overrides = vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {})
    local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)

    return {
        theme = updated_theme_colors,
        palette = updated_palette_colors,
    }
end

return M
