:set nu rnu    " Relative Line Numbers & Show current line number
:set paste     " Turn off auto indent
:set expandtab " Covert tabs to spaces
:set ruler     " Show cursor position

:nnoremap <esc><esc> :noh<return> " EscEsc to clear search

:highlight ExtraWhitespace ctermbg=red guibg=red " Show whitespace in red
:match ExtraWhitespace /\s\+$/                   " Show whitespace in red
