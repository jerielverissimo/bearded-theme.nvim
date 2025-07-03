local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias BeardedColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias BeardedColors { palette: PaletteColors, theme: ThemeColors }

--- Default configuration
---@class BeardedConfig
M.config = {
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { vivid = {}, dark = {}, all = {} },
    },
    ---@type fun(colors: BeardedColorsSpec): table<string, table>
    overrides = function()
        return {}
    end,
    ---@type { dark: string, light: string }
    background = { dark = "vivid", light = "vivid" },
    theme = "vivid",
}

local function check_config(config)
    -- Add validation logic here if needed
    return true
end

--- Update global configuration with user settings
---@param config? BeardedConfig user configuration
function M.setup(config)
    if check_config(config) then
        M.config = vim.tbl_deep_extend("force", M.config, config or {})
    else
        vim.notify("BeardedTheme: Errors found while loading user config. Using default config.", vim.log.levels.ERROR)
    end
end

--- Load the colorscheme
---@param theme? string
function M.load(theme)
    local utils = require("bearded-theme.utils")

    theme = theme or M.config.background[vim.o.background] or M.config.theme
    M._CURRENT_THEME = theme

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "bearded-theme"
    vim.o.termguicolors = true

    if M.config.compile then
        if utils.load_compiled(theme) then
            return
        end

        M.compile()
        utils.load_compiled(theme)
    else
        local colors = require("bearded-theme.colors").setup({ theme = theme, colors = M.config.colors })
        local highlights = require("bearded-theme.highlights").setup(colors, M.config)
        require("bearded-theme.highlights").highlight(highlights, M.config.terminalColors and colors.theme.term or {})
    end
end

function M.compile()
    for theme, _ in pairs(require("bearded-theme.themes")) do
        local colors = require("bearded-theme.colors").setup({ theme = theme, colors = M.config.colors })
        local highlights = require("bearded-theme.highlights").setup(colors, M.config)
        require("bearded-theme.utils").compile(theme, highlights, M.config.terminalColors and colors.theme.term or {})
    end
end

-- Create user commands
vim.api.nvim_create_user_command("BeardedCompile", function()
    for mod, _ in pairs(package.loaded) do
        if mod:match("^bearded%-theme%.") then
            package.loaded[mod] = nil
        end
    end
    M.compile()
    vim.notify("BeardedTheme: compiled successfully!", vim.log.levels.INFO)
    M.load(M._CURRENT_THEME)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, { desc = "Compile BeardedTheme colorscheme" })

vim.api.nvim_create_user_command("BeardedVivid", function()
    M.load("vivid")
end, { desc = "Load BeardedTheme Vivid variant" })

return M
