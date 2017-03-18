"HTML, xml, js, cssのインデント幅を2に設定
au BufRead,BufNewFile *.{yml,xml,html,css,js,ts} setlocal tabstop=2
au BufRead,BufNewFile *.{yml,xml,html,css,js,ts} setlocal softtabstop=2
au BufRead,BufNewFile *.{yml,xml,html,css,js,ts} setlocal shiftwidth=2

"pythonファイルのインデント幅を4に設定
au BufRead,BufNewFile *.py setlocal tabstop=4
au BufRead,BufNewFile *.py setlocal softtabstop=4
au BufRead,BufNewFile *.py setlocal shiftwidth=4
