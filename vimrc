set encoding=utf-8

colorscheme habamax

set nu rnu    " Relative Line Numbers & Show current line number
set paste     " Turn off auto indent
set expandtab " Covert tabs to spaces
set ruler     " Show cursor position
syntax enable

" Status Line Config
set laststatus=2
set statusline=
set statusline+=%#PmenuSel#\ %f\ %m%=%#CursorColumn#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]\ %p%%\ %l:%c

" Highlight 80 character limit
set textwidth=80
set colorcolumn=+1

" EscEsc to clear search
nnoremap <esc><esc> :noh<return>

" Show whitespace in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
