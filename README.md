# arch-ez-update
自学了半小时shell写出来的一个arch更新脚本，我感觉能用
支持flatpak,aur,pacman更新及清理
## 注意
需要注意:在脚本中我使用了 ***--noconfirm***，这没准会让你还没看见更新内容时系统就已经开始了更新
脚本依赖**neofetch**
## 使用方法
安装依赖``` sudo pacman -S neofetch ```
下载脚本后在当前目录下执行命令``` sudo chmod +x ./update.sh ```
运行脚本```./update.sh ```
