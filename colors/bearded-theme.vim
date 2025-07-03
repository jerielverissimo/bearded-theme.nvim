" Vim colorscheme file
" Maintainer: BeardedTheme
" Last Change: 2024

if exists('g:colors_name') | hi clear | endif
if exists('syntax_on') | syntax reset | endif

set background=dark
let g:colors_name = 'bearded-theme'

lua require('bearded-theme').load()
