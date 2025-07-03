---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec

---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec

---@class UiElements
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_reverse ColorSpec
---@field bg_dim ColorSpec Dimmed background
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background
---@field bg_p2 ColorSpec Lighter background
---@field bg_gutter ColorSpec Gutter background
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

return {
    ---@param palette PaletteColors
    ---@return ThemeColors
    vivid = function(palette)
        return {
            ui = {
                fg = palette.fg,
                fg_dim = palette.fg_dim,
                fg_reverse = palette.bg,

                bg_dim = palette.bg_dark,
                bg_gutter = palette.bg_dark,
                bg = palette.bg,
                bg_p1 = palette.bg_light,
                bg_p2 = palette.bg_lighter,

                special = palette.cyan,
                nontext = palette.gray1,
                whitespace = palette.gray1,

                bg_search = palette.search,
                bg_visual = palette.visual,

                pmenu = {
                    fg = palette.fg,
                    fg_sel = "none",
                    bg = palette.bg_lighter,
                    bg_sel = palette.selection,
                    bg_sbar = palette.bg_light,
                    bg_thumb = palette.gray1,
                },
                float = {
                    fg = palette.fg,
                    bg = palette.bg_lighter,
                    fg_border = palette.border,
                    bg_border = palette.bg_lighter,
                },
            },
            syn = {
                string = palette.green,
                variable = palette.pink,
                number = palette.orange,
                constant = palette.red,
                identifier = palette.pink,
                parameter = palette.magenta,
                fun = palette.blue,
                statement = palette.yellow,
                keyword = palette.yellow,
                operator = palette.yellow,
                preproc = palette.yellow,
                type = palette.cyan,
                regex = palette.green,
                deprecated = palette.gray2,
                comment = palette.gray1,
                punct = palette.gray3,
                special1 = palette.orange,
                special2 = palette.magenta,
                special3 = palette.cyan,
            },
            vcs = {
                added = palette.git_add,
                removed = palette.git_delete,
                changed = palette.git_change,
            },
            diff = {
                add = palette.diff_add,
                delete = palette.diff_delete,
                change = palette.diff_change,
                text = palette.diff_text,
            },
            diag = {
                ok = palette.ok,
                error = palette.error,
                warning = palette.warning,
                info = palette.info,
                hint = palette.hint,
            },
            term = {
                palette.bg_dark,     -- black
                palette.red,         -- red
                palette.green,       -- green
                palette.yellow,      -- yellow
                palette.blue,        -- blue
                palette.magenta,     -- magenta
                palette.cyan,        -- cyan
                palette.fg_dim,      -- white
                palette.gray1,       -- bright black
                palette.red,         -- bright red
                palette.green,       -- bright green
                palette.yellow,      -- bright yellow
                palette.blue,        -- bright blue
                palette.magenta,     -- bright magenta
                palette.cyan,        -- bright cyan
                palette.fg,          -- bright white
                palette.orange,      -- extended color 1
                palette.pink,        -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@return ThemeColors
    dark = function(palette)
        -- Darker variant with adjusted colors
        local darker_palette = vim.tbl_deep_extend("force", palette, {
            bg = "#0a0a0c",
            bg_dark = "#080809",
            bg_light = "#141416",
            bg_lighter = "#1a1a1c",
            fg = "#b8b8be",
            fg_dim = "#9d9da3",
        })
        
        return {
            ui = {
                fg = darker_palette.fg,
                fg_dim = darker_palette.fg_dim,
                fg_reverse = darker_palette.bg,

                bg_dim = darker_palette.bg_dark,
                bg_gutter = darker_palette.bg_dark,
                bg = darker_palette.bg,
                bg_p1 = darker_palette.bg_light,
                bg_p2 = darker_palette.bg_lighter,

                special = darker_palette.cyan,
                nontext = darker_palette.gray1,
                whitespace = darker_palette.gray1,

                bg_search = darker_palette.search,
                bg_visual = darker_palette.visual,

                pmenu = {
                    fg = darker_palette.fg,
                    fg_sel = "none",
                    bg = darker_palette.bg_lighter,
                    bg_sel = darker_palette.selection,
                    bg_sbar = darker_palette.bg_light,
                    bg_thumb = darker_palette.gray1,
                },
                float = {
                    fg = darker_palette.fg,
                    bg = darker_palette.bg_lighter,
                    fg_border = darker_palette.border,
                    bg_border = darker_palette.bg_lighter,
                },
            },
            syn = {
                string = darker_palette.green,
                variable = darker_palette.pink,
                number = darker_palette.orange,
                constant = darker_palette.red,
                identifier = darker_palette.pink,
                parameter = darker_palette.magenta,
                fun = darker_palette.blue,
                statement = darker_palette.yellow,
                keyword = darker_palette.yellow,
                operator = darker_palette.yellow,
                preproc = darker_palette.yellow,
                type = darker_palette.cyan,
                regex = darker_palette.green,
                deprecated = darker_palette.gray2,
                comment = darker_palette.gray1,
                punct = darker_palette.gray3,
                special1 = darker_palette.orange,
                special2 = darker_palette.magenta,
                special3 = darker_palette.cyan,
            },
            vcs = {
                added = darker_palette.git_add,
                removed = darker_palette.git_delete,
                changed = darker_palette.git_change,
            },
            diff = {
                add = darker_palette.diff_add,
                delete = darker_palette.diff_delete,
                change = darker_palette.diff_change,
                text = darker_palette.diff_text,
            },
            diag = {
                ok = darker_palette.ok,
                error = darker_palette.error,
                warning = darker_palette.warning,
                info = darker_palette.info,
                hint = darker_palette.hint,
            },
            term = {
                darker_palette.bg_dark,     -- black
                darker_palette.red,         -- red
                darker_palette.green,       -- green
                darker_palette.yellow,      -- yellow
                darker_palette.blue,        -- blue
                darker_palette.magenta,     -- magenta
                darker_palette.cyan,        -- cyan
                darker_palette.fg_dim,      -- white
                darker_palette.gray1,       -- bright black
                darker_palette.red,         -- bright red
                darker_palette.green,       -- bright green
                darker_palette.yellow,      -- bright yellow
                darker_palette.blue,        -- bright blue
                darker_palette.magenta,     -- bright magenta
                darker_palette.cyan,        -- bright cyan
                darker_palette.fg,          -- bright white
                darker_palette.orange,      -- extended color 1
                darker_palette.pink,        -- extended color 2
            },
        }
    end,
}
