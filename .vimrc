syn on  "高亮语法
set incsearch  "搜索时逐字符高亮
set noexpandtab "不要用空格代替制表符
colorscheme desert "配色主题

"common conf {{
set langmenu=zh_CN.UTF-8
set helplang=cn
set ai
set bs=2
set showmatch
set laststatus=2
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set cursorline
set number
set autoread
set ignorecase
set autoindent "自动缩进
set fileencoding=utf-8
set hls "高亮所有搜索匹配到的结果
set foldmethod=syntax
"补全设置，不设也能用
let Tlist_Ctags_Cmd='/usr/bin/ctags'
filetype plugin indent on
filetype plugin on
set ofu=syntaxcomplete#Complete
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的  
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim  
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口   
"}}

"conf for plugins {{
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}

"pathogen{
call pathogen#infect()
"}
"}}
