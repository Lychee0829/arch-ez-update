#!/bin/bash

# 显示系统信息
neofetch

# 读取并显示 .sysupdatelog 文件内容
cat .sysupdatelog | while read line; do
    echo "$line"
done

# 读取上次更新时间
rm -rf ./.sysupdatelog
echo "上次更新是在 $(date +"%Y-%m-%d %H:%M:%S")" > ./.sysupdatelog

# 删除并重新创建文件
echo "键入选项:  1.pacman  2.aur  3.flatpak  4.清理  (默认1-3)"
read ass

# 根据用户输入执行相应操作
case "$ass" in
    1)
        echo "开始全面系统更新"
        sudo pacman -Syu --noconfirm
        ;;
    2)
        echo "开始aur仓库更新"
        yay -Syu --noconfirm
        ;;
    3)
        echo "开始flatpak更新"
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

# 结束脚本
echo "完事"
exit