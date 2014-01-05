vimrc
=====

这个是我的vim配置，主要for python多一些，python的插件也较多。

相关技巧参考这个文档：http://linux-wiki.cn/wiki/zh-hans/%E9%85%8D%E7%BD%AE%E5%9F%BA%E4%BA%8EVim%E7%9A%84Python%E7%BC%96%E7%A8%8B%E7%8E%AF%E5%A2%83
比如补全怎么用，跳转怎么用等等。

还有这篇参考资料，可以看看一些常用的快捷键，看看怎么跳转代码：http://blog.csdn.net/jiayouxjh/article/details/8621279

vim技巧，推荐阅读：http://www.cnblogs.com/xiaochaohuashengmi/archive/2011/10/14/2211248.html

使用说明
====
使用了tagbar插件，该插件依赖于系统中的ctags命令，先在终端敲一下ctags看看有没有这条命令，如果没有的话装一个。

ubuntu系的系统使用如下命令即可:``sudo apt-get install exuberant-ctags``

关于ctags的使用说明可以参考这个，实现代码索引跳转http://smilejay.com/2012/10/vim-for-linux-programmer/

**使用：**在任意目录下克隆本项目

    git clone https://github.com/abcfy2/vimrc.git
    cd vimrc
    cp -r .* ~

或者可以做软链接，方便以后直接git pull更新生效

如果不存在``~/.vim/bundle/vundle/README.md``这个目录，则会自动克隆vundle插件，然后自动安装所需插件。

**更新：**以后.vimrc文件有更新时，需要删除.vim目录，重新执行vim即可。或者自己比对一下``.vimrc``文件中的``Bundle "xxx/xxx"``的部分与``~/.vim/bundle/``目录下的异同，删掉不再使用的插件，然后在vim的命令模式执行```:BundleInstall```安装新加入的插件即可。

**如果已经自己个性化过一些设置的话，需要备份自己的``.vimrc``文件，手工merge代码**


使用的插件
====
一些重要的插件在.vimrc文件中的注释已经给出了文档的地址，如果需要帮助可以自己打开参考，这里只列出部分插件简介和使用方法。

vim-airline
===
一个华丽的vim状态栏，但是需要注意需要给字体打补丁才能显示出一些特殊符号，具体方法参考vim-airline的github上的wiki。
直接执行installfont.sh脚本，会自动下载安装打过字符补丁的字体，然后设置自己喜欢的字体即可。
**如果还是看不到字符效果，可以尝试使用``.font``目录下提供的字体。第一次使用在终端下敲命令``fc-cache -fv``强制更新下字体缓存，
终端字体选用.font目录下提供的字体即可，或者自己参考powerline的帮助文档，自己给字体打补丁或者选用自己喜欢的打过补丁的字体。**

tagbar
===
这个插件依赖于ctags命令，需要确认系统中有这条命令。可以在代码中建立类似于IDE的代码索引跟踪功能。
    

pydiction
===
python的一个字典补全插件，直接在编写python代码中可以实现tab键补全的功能。


YouCompleteMe
===
vim神级补全插件，这个插件需要编译方可使用，否则启动vim会报错，强烈建议先读官方文档编译这个插件：https://github.com/Valloric/YouCompleteMe


nerdcommenter
===
注释代码很方便的插件，可以根据不同的代码生成不同的注释格式。v或V选定要注释的行后，\cc就是添加注释，\cu就是去掉注释。其他好用的功能可以看插件的帮助文档。


nerdtree
===
文件树插件，自带的帮助已经很详细了，直接``?``就可以看到按键帮助，如需配置可以参考插件帮助手册。


emmet-vim
===
编写html和CSS的神器，具体有多神到这里看吧。http://mattn.github.io/emmet-vim/


vim-snippets
===
一个基于特殊关键字补全的插件，具体能把什么补全成什么可以进入目录`～/.vim/bundle/vim-snippets/snippets`去看，文件名即为支持语法，打开就可以看到详细的补全规则了。

如C语言中for<tab>会补全为for (i = 0; i < count; i++) {                                                                                                                                                                                      
    
}


pyflakes-vim
===
python的语法检测插件，在有问题的语法会红色标出。

python_ifold
===
python折叠代码插件

```
更多好用的功能慢慢探索吧
```


我做的一些特殊配置
====
插件太多，有些按键有冲突，所以修改了部分插件的快捷键。如果已经安装过tagbar，那么vim ~/.vimrc就可以在右边看到vim已经找到了一些map，跳转过去就可以看到具体的按键映射了。

插件特殊配置
==
tagbar
=
```
    映射F4为打开/关闭tagbar
    nmap <silent> <F4> :TagbarToggle<CR>
    设置tagbar的宽度为40
    let g:tagbar_width = 40
```

```
map <C-l> :tabn<cr>             "下一个tab
map <C-h> :tabp<cr>             "上一个tab
map <C-n> :tabnew<cr>           "新tab
map <C-k> :bn<cr>               "下一个文件
map <C-j> :bp<cr>               "上一个文件
```

NERDTreeTabs
=
映射F3为打开/关闭文件树
map <F3> <plug>NERDTreeTabsToggle <CR>

ultisnips
=
使用``ctrl+j``触发ultisnipts片段补全
    let g:UltiSnips = {}
    let g:UltiSnips.always_use_first_snippet = 1
    let g:UltiSnips.ExpandTrigger = '<c-j>'
    let g:UltiSnips.ListSnippets = '<c-r><tab>'
    let g:UltiSnips.JumpForwardTrigger = '<tab>'
    let g:UltiSnips.JumpBackwardTrigger = '<s-tab>'


在插入模式下，使用CTRL+J即可实现UltriSnips补全。
