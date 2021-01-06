" Undo tree settings; must create directories "at least for 'backupdir' else 
" 'confirm save exit' shortcut on <F2> won't work
set undodir=~/.vimundo/
set undofile
set backupdir=~/.vimbackup/

" Forcing Vim to ask me if I want to quit
" https://vi.stackexchange.com/questions/5870/how-to-safely-quit-vim-if-theres-some-unsaved-changes
set confirm

" Line numbers and setting up splits for my 'NERDtree' to work
set number
set relativenumber
set splitright
set splitbelow

" Settings syntax for good highlighting, showing commands on status bar, and
" search settings
syntax on
set showcmd
set hlsearch
set incsearch
set ignorecase

" Long list of settings for setting up the file position crosshair
" Looks good with 'delek' colorscheme, but also with the custom theme 'embark'
set cursorline
set cursorcolumn
set colorcolumn=81

" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
" https://vi.stackexchange.com/questions/2673/how-can-i-change-the-colour-of-the-line-highlighted-with-the-cursorline-option
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight CursorColumn ctermbg=23
                      \ | highlight ColorColumn ctermbg=118
                      \ | highlight CursorLine ctermbg=17 cterm=NONE
                      \ | highlight StatusLine ctermbg=132 ctermfg=White
augroup END

" Setting colorscheme
" https://github.com/embark-theme/vim
set termguicolors
color embark

" Uncomment following line if 'embark' isnt' available (must be downloaded)
" color delek

" My favored tab settings (tab = 4 spaces)
set shiftwidth=4
set softtabstop=4
set expandtab

" Status line settings (don't know exactly what they do)
set laststatus=2
set shortmess-=S

" Comment macros
let @w = "^i#aj"
let @s = "^xj"
let @r = ":normal! @w"
let @f = ":normal! @s"

" Indent macros
let @q = "0i    aj"
let @a = "0xxxxaj"
let @e = ":normal! @q"
let @d = ":normal! @a"

" Remapping function keys to macros + save/quit commands
" Disable F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

nnoremap <F3> @w
nnoremap <F4> @q
vnoremap <F5> @r
vnoremap <F6> @f

vnoremap <F7> @e
vnoremap <F8> @d
nnoremap <F9> @s
nnoremap <F12> @a

noremap <F1> :wqa!<CR>
noremap <F2> :qall<CR>

" Netrw settings to look like NERDtree
" https://shapeshed.com/vim-netrw/
" https://vi.stackexchange.com/questions/11418/how-to-execute-a-macro-in-command-mode
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_browse_split = 4
augroup Project Drawer
    let @g = "l"
    autocmd!
    autocmd VimEnter * :Vexplore
    autocmd VimEnter * :normal @g
augroup END
