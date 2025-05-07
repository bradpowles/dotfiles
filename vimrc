:set nu rnu    " Relative Line Numbers & Show current line number
:set paste     " Turn off auto indent
:set expandtab " Covert tabs to spaces
:set ruler     " Show cursor position

" EscEsc to clear search
:nnoremap <esc><esc> :noh<return>

" Show whitespace in red
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
