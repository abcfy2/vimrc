vimrc
=====

这个是我的vim配置
相关技巧参考这个文档：http://linux-wiki.cn/wiki/zh-hans/%E9%85%8D%E7%BD%AE%E5%9F%BA%E4%BA%8EVim%E7%9A%84Python%E7%BC%96%E7%A8%8B%E7%8E%AF%E5%A2%83
比如补全怎么用，跳转怎么用等等。
还有这篇参考资料，可以看看一些常用的快捷键，看看怎么跳转代码：http://blog.csdn.net/jiayouxjh/article/details/8621279
vim技巧，推荐阅读：http://www.cnblogs.com/xiaochaohuashengmi/archive/2011/10/14/2211248.html

使用说明
=====
使用了tagbar插件，该插件依赖于系统中的ctags命令，先在终端敲一下ctags看看有没有这条命令，如果没有的话装一个
ubuntu系的系统使用如下命令即可:sudo apt-get install exuberant-ctags
关于ctags的使用说明可以参考这个，实现代码索引跳转http://smilejay.com/2012/10/vim-for-linux-programmer/

在任意目录下克隆本项目
git clone https://github.com/abcfy2/vimrc.git
cd vimrc
cp -r .\* ~
或者可以做软链接，方便以后直接git pull更新生效
