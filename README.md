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

如果不存在`~/.vim/bundle/vundle/README.md`这个目录，则会自动克隆vundle插件，然后自动安装所需插件。

**更新：**以后.vimrc文件有更新时，需要删除.vim目录，重新执行vim即可。


使用的插件
====
一些重要的插件在.vimrc文件中的注释已经给出了文档的地址，如果需要帮助可以自己打开参考，这里只列出部分插件简介和使用方法。

vim-powerline
===
一个华丽的vim状态栏，但是需要注意需要给字体打补丁才能显示出一些特殊符号，具体方法参考vim-powerline的github上的wiki。
或者用我已经上传的字体，在``.font/Terminus Medium for Powerline.otf``。第一次使用在终端下敲命令``fc-cache -fv``强制更新下字体缓存，
就可以在字体中找到``Terminus Medium for Powerline``这个字体了，设置终端字体为``Terminus Medium for Powerline``即可。


tagbar
===
这个插件依赖于ctags命令，需要确认系统中有这条命令。可以在代码中建立类似于IDE的代码索引跟踪功能。
    

pydiction
===
python的一个字典补全插件，直接在编写python代码中可以实现tab键补全的功能。


AutoComplPop
===
一个类似与IDE的关键字补全插件，敲代码的时候可以在代码下方弹出相关的候选项。


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

snipmate
=
由于与pythondict插件和supertab插件冲突，tab键补全会失效，因此改为CTRL+Z来补全

``imap <C-z> <Plug>snipMateNextOrTrigger``

在插入模式下，使用CTRL+Z即可实现simpmate补全。

**注意:**需要注意的是，可能受``AutoComplPop``插件的影响，直接ctrl+z可能不能补全，比如C代码中,for敲出来的时候下方会有自动匹配的可选项，需要按一次方向键右``→``，没有匹配项的时候再按``ctrl+z``才可以完成匹配。

