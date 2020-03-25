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
```
### 注意
可能会覆盖本地已有的配置
