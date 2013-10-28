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
Bundle 'bling/vim-airline'
 "帮助文档：https://github.com/bling/vim-airline
Bundle 'majutsushi/tagbar'
 "帮助文档：https://github.com/majutsushi/tagbar
Bundle "scrooloose/nerdcommenter"
 "帮助文档：https://github.com/scrooloose/nerdcommenter
Bundle "scrooloose/nerdtree"
 "帮助文档：https://github.com/scrooloose/nerdtree
Bundle "jistr/vim-nerdtree-tabs"
 "帮助文档：https://github.com/jistr/vim-nerdtree-tabs
Bundle "mattn/emmet-vim"
 "帮助文档：https://github.com/mattn/emmet-vim
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "kevinw/pyflakes-vim"
 "帮助文档：https://github.com/kevinw/pyflakes-vim
Bundle "vim-scripts/python_ifold"
 "python的折叠插件
Bundle "sukima/xmledit"
 "vim的xml编辑插件"
Bundle "tpope/vim-vividchalk"
Bundle "Valloric/YouCompleteMe"
 "YCM,强大的补全插件，替换掉AutoComplPop,文档：https://github.com/Valloric/YouCompleteMe
Bundle "SirVer/ultisnips"
 "snipmate的改良版本，替换掉snipmate插件
Bundle "scrooloose/syntastic"
 "非常强的语法检测插件，依赖于一些特殊命令，具体参考官方文档：https://github.com/scrooloose/syntastic

filetype on
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

"common conf {{
syn on  "高亮语法
set mouse=a "打开鼠标操作功能
set incsearch  "搜索时逐字符高亮
set noexpandtab "不要用空格代替制表符
colorscheme vividchalk "配色主题
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
set cursorline
set number
set autoread
set ignorecase
set autoindent "自动缩进
set smartindent "智能缩进
set hls "高亮所有搜索匹配到的结果
set foldmethod=syntax
filetype plugin indent on
set ruler
set showcmd
set tags=tags;/
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt+=longest
 "离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"设置编辑html,htm,css,js等网页文件的时候缩进字符为2个
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set noexpandtab tabstop=2 shiftwidth=2
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


"tagbar{
"映射F4为:TagbarToggle
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_width = 40
"}
"}}

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

"YCM与ultrisnips联合工作{
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
"}
