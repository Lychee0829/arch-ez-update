# arch-ez-update
这是一个用来简化Arch Linux软件包管理和清理的脚本
支持Flatpak,Aur,Pacman软件包更新及清理
## 注意事项
需要注意:在脚本中命令使用了 ***--noconfirm***，这在某些情况下可能会导致意外的结果
脚本依赖**fastfetch**
## 使用方法
安装依赖``` sudo pacman -S fastfetch ```
下载脚本后在当前目录下执行命令``` sudo chmod +x ./update.sh ```
在当前目录下执行```./update.sh ```以运行脚本
