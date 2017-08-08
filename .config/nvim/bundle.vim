""""""""""""""""""""""""
" bundle管理
""""""""""""""""""""""""
set runtimepath+=~/.config/nvim/dein.vim/

if dein#load_state('~/.config/nvim/plugin')
    call dein#begin('~/.config/nvim/plugin')

""""""""""""""""""""""""
" ライブラリ
""""""""""""""""""""""""
    call dein#add("~/.config/nvim/dein.vim")
    call dein#add("vim-jp/vimdoc-ja")

    " 美夢王
    call dein#add("Shougo/unite.vim")
    call dein#add("Shougo/vimfilter")
    call dein#add("Shougo/neocomplcache.vim")

    " カラースキーム
    call dein#add("altercation/vim-colors-solarized")

    call dein#add("othree/eregex.vim")

    """" コーディング

    " python
    call dein#add("alfredodeza/khuno.vim")
    call dein#add("Glench/Vim-Jinja2-Syntax")
    call dein#add("Yggdroot/indentLine")

    " html/css/js
"    call dein#add('mattn/emmet-vim')
"    call dein#add("tpope/vim-surround")
    call dein#add("hail2u/vim-css3-syntax")
"    call dein#add('othree/html5.vim')
"    call dein#add('pangloss/vim-javascript')
"    call dein#add('leafgarland/typescript-vim')
"    call dein#add('Quramy/tsuquyomi')
    call dein#add('jason0x43/vim-js-indent')

    call dein#add("plasticboy/vim-markdown")


""""""""""""""""""""""""

    call dein#end()
    call dein#save_state()

    " 自動インストール
"    call dein#install()
endif
