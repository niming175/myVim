# myVim
我的vim配置

### 安装
```bash
# 复制文件和配置到先关目录
cd myVim
cp .vimrc ~/.vimrc
cp -r .vim ~/.vim

# 安装
# 1、打开vim 敲入命令
:PlugInstall

# 兼容neo-vim
ln -s ./vim ~/.config/nvim
ln -s .vimrc ~/.config/vim/init.vim

# 万能补全插件支持
sudo apt install build-essential cmake vim python3-dev
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

# 需要php自定义类的补全和跳转
```bash
# 安装ctags
# 默认vim是已是安装了的，有的时候可能要重装下
sudo apt install ctags

# 在.bashrc中加入
#ctags
alias phptags='ctags --langmap=php:.engine.inc.module.theme.php  --php-kinds=cdf  --languages=php'

# 添加~/.ctags文件， 写入
--regex-php=/^[ \t]*[(private|public|static)( \t)]*function[ \t]+([A-Za-z0-9_]+)[ \t]*\(/\1/f, function, functions/
--regex-php=/^[ \t]*[(private|public|static)]+[ \t]+\$([A-Za-z0-9_]+)[ \t]*/\1/p, property, properties/
--regex-php=/^[ \t]*(const)[ \t]+([A-Za-z0-9_]+)[ \t]*/\2/d, const, constants/

# 重启下bash,最后就可以再工程更目录生成tags
phptags -R

```
```
### 注意
可能会覆盖本地已有的配置
