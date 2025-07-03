local M = {}

---@param colors BeardedColors
---@param config? BeardedConfig
function M.setup(colors, config)
    config = config or require("bearded-theme").config
    local theme = colors.theme

    local highlights = {
        -- LSP Semantic Tokens
        ["@lsp.type.class"] = { link = "@type" },
        ["@lsp.type.comment"] = { link = "@comment" },
        ["@lsp.type.enum"] = { link = "@type" },
        ["@lsp.type.enumMember"] = { link = "@constant" },
        ["@lsp.type.function"] = { link = "@function" },
        ["@lsp.type.interface"] = { link = "@type" },
        ["@lsp.type.macro"] = { link = "@function.macro" },
        ["@lsp.type.method"] = { link = "@function.method" },
        ["@lsp.type.namespace"] = { link = "@namespace" },
        ["@lsp.type.parameter"] = { link = "@parameter" },
        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.struct"] = { link = "@type" },
        ["@lsp.type.type"] = { link = "@type" },
        ["@lsp.type.typeParameter"] = { link = "@type" },
        ["@lsp.type.variable"] = { link = "@variable" },
        
        -- LSP Semantic Modifiers
        ["@lsp.mod.deprecated"] = { fg = theme.syn.deprecated, strikethrough = true },
        ["@lsp.mod.readonly"] = { fg = theme.syn.constant },
        ["@lsp.mod.static"] = { fg = theme.syn.special1 },
        ["@lsp.mod.abstract"] = { fg = theme.syn.type, italic = true },
        
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
