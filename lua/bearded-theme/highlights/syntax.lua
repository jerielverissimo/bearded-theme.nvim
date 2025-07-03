local M = {}

---@param colors BeardedColors
---@param config? BeardedConfig
function M.setup(colors, config)
    config = config or require("bearded-theme").config
    local theme = colors.theme

    local highlights = {
        -- Comments
        Comment = vim.tbl_extend("force", { fg = theme.syn.comment }, config.commentStyle),
        SpecialComment = vim.tbl_extend("force", { fg = theme.syn.comment }, config.commentStyle),
        
        -- Constants
        Constant = { fg = theme.syn.constant },
        String = { fg = theme.syn.string },
        Character = { fg = theme.syn.string },
        Number = { fg = theme.syn.number },
        Boolean = { fg = theme.syn.constant },
        Float = { fg = theme.syn.number },
        
        -- Identifiers
        Identifier = { fg = theme.syn.identifier },
        Function = vim.tbl_extend("force", { fg = theme.syn.fun }, config.functionStyle),
        
        -- Statements
        Statement = vim.tbl_extend("force", { fg = theme.syn.statement }, config.statementStyle),
        Conditional = vim.tbl_extend("force", { fg = theme.syn.keyword }, config.keywordStyle),
        Repeat = vim.tbl_extend("force", { fg = theme.syn.keyword }, config.keywordStyle),
        Label = vim.tbl_extend("force", { fg = theme.syn.keyword }, config.keywordStyle),
        Operator = { fg = theme.syn.operator },
        Keyword = vim.tbl_extend("force", { fg = theme.syn.keyword }, config.keywordStyle),
        Exception = vim.tbl_extend("force", { fg = theme.syn.keyword }, config.keywordStyle),
        
        -- PreProcessor
        PreProc = { fg = theme.syn.preproc },
        Include = { fg = theme.syn.preproc },
        Define = { fg = theme.syn.preproc },
        Macro = { fg = theme.syn.preproc },
        PreCondit = { fg = theme.syn.preproc },
        
        -- Types
        Type = vim.tbl_extend("force", { fg = theme.syn.type }, config.typeStyle),
        StorageClass = vim.tbl_extend("force", { fg = theme.syn.type }, config.typeStyle),
        Structure = vim.tbl_extend("force", { fg = theme.syn.type }, config.typeStyle),
        Typedef = vim.tbl_extend("force", { fg = theme.syn.type }, config.typeStyle),
        
        -- Special
        Special = { fg = theme.syn.special1 },
        SpecialChar = { fg = theme.syn.special1 },
        Tag = { fg = theme.syn.special1 },
        Delimiter = { fg = theme.syn.punct },
        Debug = { fg = theme.syn.special2 },
        
        -- Underlined
        Underlined = { fg = theme.syn.special2, underline = true },
        
        -- Ignore
        Ignore = { fg = theme.ui.nontext },
        
        -- Error
        Error = { fg = theme.diag.error },
        
        -- Todo
        Todo = { fg = theme.syn.keyword, bold = true },
        
        -- HTML/XML
        htmlTag = { fg = theme.syn.keyword },
        htmlEndTag = { fg = theme.syn.keyword },
        htmlTagName = { fg = theme.syn.fun },
        htmlArg = { fg = theme.syn.identifier },
        htmlString = { fg = theme.syn.string },
        htmlValue = { fg = theme.syn.string },
        
        -- CSS
        cssBraces = { fg = theme.syn.punct },
        cssClassName = { fg = theme.syn.type },
        cssClassNameDot = { fg = theme.syn.punct },
        cssColor = { fg = theme.syn.constant },
        cssFunction = { fg = theme.syn.fun },
        cssIdentifier = { fg = theme.syn.identifier },
        cssImportant = { fg = theme.syn.keyword },
        cssInclude = { fg = theme.syn.keyword },
        cssMedia = { fg = theme.syn.keyword },
        cssProp = { fg = theme.syn.identifier },
        cssPseudoClass = { fg = theme.syn.special1 },
        cssPseudoClassId = { fg = theme.syn.special1 },
        cssTagName = { fg = theme.syn.fun },
        cssUnitDecorators = { fg = theme.syn.number },
        cssURL = { fg = theme.syn.string },
        cssValueLength = { fg = theme.syn.number },
        cssValueNumber = { fg = theme.syn.number },
        
        -- JavaScript
        javaScriptBraces = { fg = theme.syn.punct },
        javaScriptFunction = { fg = theme.syn.keyword },
        javaScriptIdentifier = { fg = theme.syn.keyword },
        javaScriptMember = { fg = theme.syn.identifier },
        javaScriptNumber = { fg = theme.syn.number },
        javaScriptNull = { fg = theme.syn.constant },
        javaScriptParens = { fg = theme.syn.punct },
        
        -- JSON
        jsonKeyword = { fg = theme.syn.identifier },
        jsonQuote = { fg = theme.syn.punct },
        jsonBraces = { fg = theme.syn.punct },
        jsonString = { fg = theme.syn.string },
        
        -- Markdown
        markdownCode = { fg = theme.syn.special1 },
        markdownCodeBlock = { fg = theme.syn.special1 },
        markdownCodeDelimiter = { fg = theme.syn.special1 },
        markdownH1 = { fg = theme.syn.fun, bold = true },
        markdownH2 = { fg = theme.syn.fun, bold = true },
        markdownH3 = { fg = theme.syn.fun, bold = true },
        markdownH4 = { fg = theme.syn.fun, bold = true },
        markdownH5 = { fg = theme.syn.fun, bold = true },
        markdownH6 = { fg = theme.syn.fun, bold = true },
        markdownHeadingDelimiter = { fg = theme.syn.fun },
        markdownHeadingRule = { fg = theme.syn.fun },
        markdownId = { fg = theme.syn.identifier },
        markdownIdDeclaration = { fg = theme.syn.identifier },
        markdownIdDelimiter = { fg = theme.syn.punct },
        markdownLinkDelimiter = { fg = theme.syn.punct },
        markdownLinkText = { fg = theme.syn.string },
        markdownListMarker = { fg = theme.syn.keyword },
        markdownOrderedListMarker = { fg = theme.syn.keyword },
        markdownRule = { fg = theme.syn.punct },
        markdownUrl = { fg = theme.syn.string },
        
        -- YAML
        yamlKey = { fg = theme.syn.identifier },
        yamlValue = { fg = theme.syn.string },
        yamlAnchor = { fg = theme.syn.special1 },
        yamlAlias = { fg = theme.syn.special1 },
        yamlDocumentHeader = { fg = theme.syn.keyword },
        yamlDocumentStart = { fg = theme.syn.keyword },
        yamlDocumentEnd = { fg = theme.syn.keyword },
        yamlBlockMappingKey = { fg = theme.syn.identifier },
        yamlBlockCollectionItemStart = { fg = theme.syn.keyword },
        yamlFlowMappingKey = { fg = theme.syn.identifier },
        yamlFlowCollectionDelimiter = { fg = theme.syn.punct },
        yamlFlowIndicator = { fg = theme.syn.punct },
        yamlFlowMappingDelimiter = { fg = theme.syn.punct },
        yamlFlowSequenceDelimiter = { fg = theme.syn.punct },
        yamlNodeTag = { fg = theme.syn.type },
        yamlPlainScalar = { fg = theme.syn.string },
        yamlQuotedString = { fg = theme.syn.string },
    }

    return highlights
end

return M
