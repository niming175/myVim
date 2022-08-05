# myVim


### 我的vim配置
- 集成[vim-plug](https://github.com/junegunn/vim-plug)管理插件；
- coc.nvim 子插件管理
- 支持文件查找
- 支持函数跳转
- 支持目录树
- 支持js, php等自动补全
- 支持`prettier`格式化
- 支持spell check 单词检查
- 支持js，php 错误检查
- 支持当前文件函数目录

### 环境要求
- neovim >= 0.4.0
- nodejs >= 12.12
- vim >= 8.1.1

### 安装
```bash
# 软连接文件和配置,假设工程目录在家目录下
# vim
ln -s ~/myVim/vimrc ~/.vimrc
ln -s ~/myVim/.vim ~/.vim

# neo-vim
ln -s vim ~/.config/nvim
ln -s vimrc ~/.config/nvim/init.vim

# 安装
# 1、打开vim 敲入命令
:PlugInstall

# 2、安装完后，退出，再打开vim， 此时会自动安装coc的自插件

```

---

### 使用

**修改热键**
默认使用空格键做热键
>let mapleader=' '

**快捷键**  

|功能|快捷键|说明|
|-|-|-|
|目录树|`热键` + `n`|打开目录树，再按下，关闭目录树|
|文件查找|`ctrl` + `p`||
|分屏： 左右分屏|`s` + `l`|在n 模式下输入快捷键|
|分屏： 上下分屏|`s` + `k`||
|分屏：修改分屏大小|`热键` + `上、下、左、右`||
|分屏调整|`热键` + `h、j、k、l`|对别应左、下、上、右|
|tab|`热键` + `t`|新建tab|
|tab|`热键` + `-`|切换到上一个tab|
|tab|`热键` + `=`|切换到下一个tab|
|搜索|`-`|搜索状态下，下一个搜索结果|
|搜索|`=`|搜索状态下，上一个结果|
|搜索|`热键` + `回车`|取消搜索结果高亮|
|移动|`alt` + `上、下`|上下移动当前行|
|移动|选中多行 `alt` + `上、下`|移动多行|
|格式化|`热键` + `f`|n 模式下， 格式化当前文档|
|格式化|`热键` + `f`|v 模式，格式化选中文档|
|快速修复|`热键` + `a`|eslint和单词检查快速修复建议|
|MarkDown |`热键` + `m`| 打开md文档编辑预览|
|函数跳转|`ctrl` + `b` + `b`|如果函数在其他文件，会新开tab|
|注释|`ctrl` + `c`|注释与取消注释|

**其他**

1、选中多行编辑

这个有点类似`vscode`的`ctrl` + `d`。按住`shift` + 左右键，选择单词，然后`ctrl` + `d`, 选中上下文多个相同单词，最后输入`i`进行编辑修改; 没有选择关键字，直接`ctrl` + `d`, 默认选中当前光标的单词
> 这种模式下的自动补全可能不是很好用；退出此模式，要双击`esc`键

### 未来计划
- 整个工程目录下搜索，像`vscode` 的`ctrl` + `shift` + `f`;
- 优化：文件查找排除`node_modules`，`dist`等文件夹；






