" Vim colorscheme file - Vivid variant
" Maintainer: BeardedTheme
" Last Change: 2024

if exists('g:colors_name') | hi clear | endif
if exists('syntax_on') | syntax reset | endif

set background=dark
let g:colors_name = 'bearded-vivid'

lua require('bearded-theme').load('vivid')
