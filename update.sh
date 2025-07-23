#!/bin/bash

# 显示系统信息
fastfetch
# 先帝创业未半而中道崩殂
trap 'echo "用户退出" && kill -1 $$' SIGINT
# 读取上次更新时间
grep -e -Syu /var/log/pacman.log | tail -1

echo "键入选项:  1.pacman  2.aur  3.flatpak  4.清理  (默认1-3)"
read choice

# 执行相应操作
case "$choice" in
    1)
        echo "开始全面更新系统"
        sudo pacman -Syu --noconfirm
        ;;
    2)
        echo "开始更新Aur软件包"
        yay -Syu --noconfirm
        ;;
    3)
        echo "开始更新flatpak软件包"
        flatpak update
        ;;
    4)
        echo "开始清理"
        sudo pacman -Scc
        yay -scc
        flatpak uninstall --unused
        ;;
    *)
        echo "开始所有更新"
        sudo pacman -Syu --noconfirm
        flatpak update 
        yay -Syu --noconfirm
        ;;
esac

# 结束
echo "完事"
exit
