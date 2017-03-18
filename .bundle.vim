""""""""""""""""""""""""
" bundle管理
""""""""""""""""""""""""
if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin()


""""""""""""""""""""""""
" ライブラリ
""""""""""""""""""""""""
NeoBundle "vim-jp/vimdoc-ja"

" 美夢王
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimfiler"
NeoBundle "Shougo/neocomplcache.vim"
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak', 
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }


NeoBundle "osyo-manga/unite-quickfix"

" カラースキーム
NeoBundle "altercation/vim-colors-solarized"

NeoBundle "othree/eregex.vim"
NeoBundle 'LeafCage/yankround.vim'

"""" コーディング

" python
NeoBundle "alfredodeza/khuno.vim"
NeoBundle "Rykka/riv.vim"
NeoBundle "Glench/Vim-Jinja2-Syntax"
NeoBundle "Yggdroot/indentLine"

" html/css/js
NeoBundle 'mattn/emmet-vim'
NeoBundle "tpope/vim-surround"
NeoBundle "hail2u/vim-css3-syntax"
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'jason0x43/vim-js-indent'

NeoBundle "plasticboy/vim-markdown"


""""""""""""""""""""""""

call neobundle#end()

" 自動インストール
NeoBundleCheck
