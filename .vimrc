" Bundle settings
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
"vundle设置{{
 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
 "帮助文档：https://github.com/bling/vim-airline
Bundle 'majutsushi/tagbar'
 "帮助文档：https://github.com/majutsushi/tagbar
Bundle 'rkulla/pydiction'
 "帮助文档：https://github.com/rkulla/pydiction
Bundle "scrooloose/nerdcommenter"
 "帮助文档：https://github.com/scrooloose/nerdcommenter
Bundle "scrooloose/nerdtree"
 "帮助文档：https://github.com/scrooloose/nerdtree
Bundle "jistr/vim-nerdtree-tabs"
 "帮助文档：https://github.com/jistr/vim-nerdtree-tabs
Bundle "mattn/emmet-vim"
 "帮助文档：https://github.com/mattn/emmet-vim
Bundle "tomtom/tlib_vim"
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"
 "帮助文档：https://github.com/honza/vim-snippets
Bundle "MarcWeber/vim-addon-manager"
Bundle "kevinw/pyflakes-vim"
 "帮助文档：https://github.com/kevinw/pyflakes-vim
Bundle "vim-scripts/python_ifold"
 "python的折叠插件
Bundle "sukima/xmledit"
 "vim的xml编辑插件"
Bundle "tpope/vim-vividchalk"
Bundle 'Valloric/YouCompleteMe'
 "神级补全插件YCM，强烈建议使用前先读文档
 "https://github.com/Valloric/YouCompleteMe
Bundle 'scrooloose/syntastic'
 "缩进线插件
Bundle "Yggdroot/indentLine"

filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif
"}}

"解决vim乱码{{
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"}}
"common conf {{
syn on  "高亮语法
set mouse=a "打开鼠标操作功能
set incsearch  "搜索时逐字符高亮
colorscheme desert "配色主题
set cursorline
hi CursorLine ctermbg=236
set encoding=utf-8
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
set number
set autoread
set ignorecase
set autoindent "自动缩进
set smartindent "智能缩进
set hls "高亮所有搜索匹配到的结果
set foldmethod=syntax
set ruler
set showcmd
set tags=tags;/
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt+=longest
 "离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"设置编辑html,htm,css,js等网页文件的时候缩进字符为2个
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set completeopt+=menu
set wildmenu
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
 "回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
 "上下左右键的行为
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "<PageUp>"

if has( "gui_running" )
    set go=aAce
    set transparency=30
    set showtabline=2
    set columns=140
    set lines=40
endif

"}}

"conf for plugins {{
"airline{
  set t_Co=256
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
"}

"pydiction{{
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
"}}

"tagbar{
"映射F4为:TagbarToggle
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_width = 40
"}
"}}

"AutoComplPop{
let g:acp_completeoptPreview = 1
"}

"vim的多标签编辑快捷键映射{
map <C-l> :tabn<cr>             
"下一个tab
map <C-h> :tabp<cr>             
"上一个tab
map <C-n> :tabnew<cr>           
"新tab
map <C-k> :bn<cr>               
"下一个文件
map <C-j> :bp<cr>               
"上一个文件
"}

"NERDTree-Tabs{
let g:nerdtree_tabs_open_on_console_startup=1       
"设置打开vim的时候默认打开目录树
map <F3> <plug>NERDTreeTabsToggle <CR>         
"设置打开目录树的快捷键
"}

"UltiSnips{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
"}

"自动跳转到上一次光标的位置{
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"}
