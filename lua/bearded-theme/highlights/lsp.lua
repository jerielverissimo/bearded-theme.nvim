local M = {}

---@param colors BeardedColors
---@param config? BeardedConfig
function M.setup(colors, config)
    config = config or require("bearded-theme").config
    local theme = colors.theme

    local highlights = {
        -- LSP Semantic Tokens (matching VS Code semanticTokenColors)
        ["@lsp.type.class"] = { fg = theme.syn.type },  -- A95EFF (purple)
        ["@lsp.type.comment"] = { link = "@comment" },
        ["@lsp.type.enum"] = { fg = theme.syn.type },   -- A95EFF (purple)
        ["@lsp.type.enumMember"] = { fg = theme.syn.type },  -- A95EFF (purple)
        ["@lsp.type.function"] = { link = "@function" },
        ["@lsp.type.interface"] = { fg = theme.syn.type },
        ["@lsp.type.macro"] = { link = "@function.macro" },
        ["@lsp.type.method"] = { link = "@function.method" },
        ["@lsp.type.namespace"] = { fg = theme.syn.fun },  -- 28A9FF (blue)
        ["@lsp.type.parameter"] = { fg = theme.syn.parameter },  -- E66DFF (magenta)
        ["@lsp.type.property"] = { fg = theme.syn.special1 },  -- FF7135 (orange)
        ["@lsp.type.struct"] = { fg = theme.syn.type },
        ["@lsp.type.type"] = { fg = theme.syn.type },
        ["@lsp.type.typeParameter"] = { fg = theme.syn.type },
        ["@lsp.type.variable"] = { fg = theme.syn.variable },  -- FF478D (pink)
        
        -- Additional semantic tokens to match VS Code
        ["@lsp.type.class.declaration"] = { fg = theme.syn.type },  -- A95EFF (purple)
        ["@lsp.type.decorator"] = { fg = theme.syn.parameter },  -- E66DFF (magenta)
        ["@lsp.type.property.declaration"] = { fg = theme.ui.fg },  -- c5c5cb (gray)
        ["@lsp.type.variable.defaultLibrary"] = { fg = theme.syn.special3 },  -- 14E5D4 (cyan)
        
        -- LSP Semantic Modifiers
        ["@lsp.mod.deprecated"] = { fg = theme.syn.deprecated, strikethrough = true },
        ["@lsp.mod.readonly"] = { fg = theme.syn.constant },
        ["@lsp.mod.static"] = { fg = theme.syn.special1 },
        ["@lsp.mod.abstract"] = { fg = theme.syn.type, italic = true },
        ["@lsp.mod.declaration"] = { fg = theme.syn.type },  -- For class.declaration
        ["@lsp.mod.defaultLibrary"] = { fg = theme.syn.special3 },  -- For variable.defaultLibrary
        
        -- LSP Diagnostics
        DiagnosticError = { fg = theme.diag.error },
        DiagnosticWarn = { fg = theme.diag.warning },
        DiagnosticInfo = { fg = theme.diag.info },
        DiagnosticHint = { fg = theme.diag.hint },
        DiagnosticOk = { fg = theme.diag.ok },
        
        -- LSP Diagnostic Virtual Text
        DiagnosticVirtualTextError = { fg = theme.diag.error, bg = "NONE" },
        DiagnosticVirtualTextWarn = { fg = theme.diag.warning, bg = "NONE" },
        DiagnosticVirtualTextInfo = { fg = theme.diag.info, bg = "NONE" },
        DiagnosticVirtualTextHint = { fg = theme.diag.hint, bg = "NONE" },
        DiagnosticVirtualTextOk = { fg = theme.diag.ok, bg = "NONE" },
        
        -- LSP Diagnostic Underlines
        DiagnosticUnderlineError = { undercurl = config.undercurl, sp = theme.diag.error },
        DiagnosticUnderlineWarn = { undercurl = config.undercurl, sp = theme.diag.warning },
        DiagnosticUnderlineInfo = { undercurl = config.undercurl, sp = theme.diag.info },
        DiagnosticUnderlineHint = { undercurl = config.undercurl, sp = theme.diag.hint },
        DiagnosticUnderlineOk = { undercurl = config.undercurl, sp = theme.diag.ok },
        
        -- LSP Diagnostic Signs
        DiagnosticSignError = { fg = theme.diag.error, bg = theme.ui.bg_gutter },
        DiagnosticSignWarn = { fg = theme.diag.warning, bg = theme.ui.bg_gutter },
        DiagnosticSignInfo = { fg = theme.diag.info, bg = theme.ui.bg_gutter },
        DiagnosticSignHint = { fg = theme.diag.hint, bg = theme.ui.bg_gutter },
        DiagnosticSignOk = { fg = theme.diag.ok, bg = theme.ui.bg_gutter },
        
        -- LSP Floating Windows
        DiagnosticFloatingError = { fg = theme.diag.error, bg = theme.ui.float.bg },
        DiagnosticFloatingWarn = { fg = theme.diag.warning, bg = theme.ui.float.bg },
        DiagnosticFloatingInfo = { fg = theme.diag.info, bg = theme.ui.float.bg },
        DiagnosticFloatingHint = { fg = theme.diag.hint, bg = theme.ui.float.bg },
        DiagnosticFloatingOk = { fg = theme.diag.ok, bg = theme.ui.float.bg },
        
        -- LSP References
        LspReferenceText = { bg = theme.ui.bg_search },
        LspReferenceRead = { bg = theme.ui.bg_search },
        LspReferenceWrite = { bg = theme.ui.bg_search },
        
        -- LSP Code Lens
        LspCodeLens = { fg = theme.syn.comment, italic = true },
        LspCodeLensSeparator = { fg = theme.syn.comment },
        
        -- LSP Signature Help
        LspSignatureActiveParameter = { fg = theme.syn.parameter, bold = true },
        
        -- LSP Document Highlights
        LspInlayHint = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
    }

    return highlights
end

return M
