# myVim
我的vim配置

### 安装
```bash
# 软连接文件和配置,假设工程目录在家目录下
ln -s ~/myVim/vimrc ~/.vimrc
ln -s ~/myVim/.vim ~/.vim

# 安装
# 1、打开vim 敲入命令
:PlugInstall

# 兼容neo-vim
ln -s ./vim ~/.config/nvim
ln -s .vimrc ~/.config/vim/init.vim

```
