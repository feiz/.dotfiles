"""""""""""""""""""""""
" 最優先設定
""""""""""""""""""""""""
source ~/.bundle.vim


set encoding=utf-8  " エンコーディング
set t_Co=256 " 256色ターミナル

filetype plugin on
filetype indent on


""""""""""""""""""""""""
" ディレクトリ関連
""""""""""""""""""""""""

"set backupdir=$HOME/tmp,. " バックアップファイル
"set directory=$HOME/tmp,. " スワップファイル
set noesckeys "インサートモードでESCが即座に利くようにする
"set timeoutlen=200 " キー入力タイムアウト
let g:MRU_File = $HOME . "/tmp/.vim_mru_files"


""""""""""""""""""""""""
" 色と見た目
""""""""""""""""""""""""

syntax enable

let g:solarized_termcolors=256  " 256色ターミナル
let g:solarized_termtrans=1  " 背景色つけると見づらいのでなしにする
let g:solarized_contrast="high" " ハイコントラスト色設定

set background=dark
colorscheme solarized

highlight LineNr ctermfg=166  " 行番号が暗くて見えないのでオレンジにしておく
"" 行ハイライト
"set cursorline
"highlight CursorLine cterm=underline
"" 列ハイライト
"set cursorcolumn
"highlight CursorColumn cterm=bold

set shellslash " /でファイル名を展開する
set number " 行番号
set list " 不可視文字を表示
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:< " 不可視文字の表示方法
set ruler " ルーラー表示

set showmatch " 閉じ括弧を打つと対応する開き括弧がハイライトされる
set matchtime=3

highlight SpellBad cterm=bold,undercurl ctermbg=234  " SyntaxErrorの表示スタイルをまいるどにする


""""""""""""""""""""""""
" タブとインデント
""""""""""""""""""""""""

set expandtab " タブの代わりに空白
set autoindent " 自動インデント
set smartindent " 高度な自動インデント
set shiftround " ><によるインデントをshiftwidthの倍数に丸める

set backspace=indent,eol,start " backspaceでいろいろ消せるように

set ambiwidth=double " 一部の2バイト文字の幅を正常に認識させる


""""""""""""""""""""""""
" 折りたたみ
""""""""""""""""""""""""

set foldmethod=indent " 折り畳み範囲検出方法
"set foldclose=all " 折り畳み範囲からカーソルが出たらクローズ
set foldnestmax=2 " ネスト2段目まで折り畳み
set foldminlines=10 " 折り畳み最小行数


""""""""""""""""""""""""
" 検索
""""""""""""""""""""""""

set hlsearch " 検索語ハイライト
set incsearch " インクリメンタルサーチ
set ignorecase smartcase " スマートな大小文字区別
set magic


""""""""""""""""""""""""
" vimdiff
""""""""""""""""""""""""

nnoremap <silent> dl :diffget 2<CR>:diffupdate<CR>]czz
nnoremap <silent> do :diffget 3<CR>:diffupdate<CR>]czz
nnoremap <silent> du :diffput 1<CR>:diffupdate<CR>]czz


"""""""""""""""""""""""
" タブ操作
"""""""""""""""""""""""

set showtabline=2 "常にタブラインを表示
map <silent> <C-w><C-t> :tabnew<CR>
map <silent> <C-w><C-n> :tabnext<CR>
map <silent> <C-w><C-p> :tabprev<CR>


"""""""""""""""""""""""
" ウィンドウ操作
"""""""""""""""""""""""

set splitright " ウィンドウ分割後に右側をアクティブにする
set splitbelow " 下側をアクティブにする


"""""""""""""""""""""""
" Unite.vim
"""""""""""""""""""""""

nnoremap ;; :Unite -no-split -buffer-name=files buffer file_mru file<CR>
nnoremap ;f :UniteWithBufferDir -no-split -buffer-name=files file<CR>
"nnoremap / :Unite -no-split -start-insert line<CR>
nnoremap ;q :Unite -no-quit qf<CR>

let g:unite_update_time=10
let g:unite_winheight = 10



"""""""""""""""""""""""
" vimfiler
"""""""""""""""""""""""
nnoremap ;f :VimFiler -create<CR>

let g:vimfiler_enable_auto_cd = 1
"let g:vimfiler_as_default_explorer = 1  " netrwを置き換え
let g:vimfiler_safe_mode_by_default = 0 " セーフモード無効
"let g:netrw_liststyle = 3


"""""""""""""""""""""""
" grepとQuickFix
"""""""""""""""""""""""

augroup greps
autocmd! greps

function! SilentGrep(args)
    " grepしたあとでredrawを叩く関数
    execute "silent! grep! -rI " . a:args
    redraw!
    endfunction
" 関数呼び出しのカッコを端折るためにコマンドとして定義
command! -nargs=+ Grep call SilentGrep(<q-args>)

" 検索っぽくgrepを呼び出す
nnoremap <C-f> :Grep 
nnoremap <C-g> :Grep <cword> *<CR>

" quickfixウィンドウを開く
nnoremap <silent> ;c :silent botright cwindow <CR>
" 現在のウィンドウのlocation listを開く
nnoremap <silent> ;l :silent botright lwindow<CR>

" quickfixの前後移動
nnoremap <C-c><C-n> :cnext<CR>
nnoremap <C-c><C-p> :cprev<CR>

" location listの前後移動
nnoremap <C-l><C-n> :lnext<CR>
nnoremap <C-l><C-p> :lprev<CR>

" Grep後に自動でquickfixを開く
autocmd greps QuickFixCmdPost grep normal ;c


""""""""""""""""""""""
" ヘルプ
""""""""""""""""""""""

set helplang=ja,en

" カーソル位置の単語でヘルプを検索
nnoremap H :help <C-r><C-w><CR>
" ヽヘルプをgrep
nnoremap <C-h> :HelpGrep <C-r><C-w><CR>

" helpgrep後にQuickFixが自動で開くようにする
cnoreabbrev hg HelpGrep
function! HelpGrepQf(arg)
    execute "helpgrep " . a:arg
    normal ;c
endfunction
command! -nargs=1 HelpGrep call HelpGrepQf(<q-args>)

""""""""""""""""""""""
" 短縮入力
""""""""""""""""""""""

" pdb
inoreabbrev pdb import pdb;pdb.set_trace()

" python用 # -*- coding: utf-8 -*-の挿入
inoreabbrev coding:  # -*- coding: utf-8 -*-

" redmine用のrefs #branchname を挿入する
nnoremap B a refs<ESC>:r!hg branch \| sed -e s/^t/\\#/g<CR>kJ


""""""""""""""""""""""
" 雑多なマッピング
" """"""""""""""""""""

" vimrcのリロード
nnoremap <Space>r :source $MYVIMRC<CR>
" sphinxのmake
nnoremap <Space>m :!make clean;make html<CR>
" ヘルプタグ貼り直し
nnoremap <Space>h :call pathogen#helptags()<CR>
" flake8によるシンタックスチェック
nnoremap <silent> <Space>f :Khuno show<CR>
" ハイライト解除
nnoremap <ESC><ESC> :nohl<CR>

""""""""""""""""""""""""
" その他
""""""""""""""""""""""""

set clipboard=unnamed " クリップボードにコピー
set tags=~/.tags " タグディレクトリ

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" wildmenu
set wildmenu
set wildmode=list:full

set laststatus=1 "ステータスラインを常に表示
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
"set showcmd " コマンドをラインに表示

" 矩形選択をフリーカーソルにする
set virtualedit+=block

" ワイルドカード検索時に優先度を下げる拡張子
set suffixes+=.pyc

" yankround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" Khuno
let g:khuno_ignore = "E501"

" 入力モードでの行頭行末移動
inoremap <C-e> <End>
inoremap <C-a> <Home>

" C-[のあとで画面をフラッシュする
" #TODO
" eregex
"nnoremap / :M/
"nnoremap ? :M?
"nnoremap , /
"nnoremap ,? ?

" Ctrl+Aのエミュレート
cnoremap <C-a> <Home>

" 互換設定オフ（最下段固定）
set nocompatible
