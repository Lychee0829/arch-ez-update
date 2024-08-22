#!/bin/bash
neofetch
cat .sysupdatelog | while read line
do
    echo $line
done
#读取上次更新时间
rm -rf ./.sysupdatelog
echo  上次更新是在 `date +"%Y-%m-%d %H:%M:%S"` >> ./.sysupdatelog
#删除并重新创建文件
read -p " 键入选项:  1.pacman  2.aur  3.flatpak  4.清理  (默认1-3)" num
if [[ $num -eq 1 ]];  
    then  
    echo 开始全面系统更新
    sudo pacman -Syu --noconfirm
elif [[ $num -eq 2 ]];  
    then
    echo 开始aur仓库更新  
    yay -Syu --noconfirm
elif [[ $num -eq 3 ]];  
    then
    echo 开始flatpak更新  
    flatpak update
elif [[ $num -eq 4 ]];  
    then
    echo 开始清理
    sudo pacman -Scc
    yay -scc
    flatpak uninstall --unused
else  
    echo 开始所有更新
    sudo pacman -Syu --noconfirm
    flatpak update
    yay -Syu --noconfirm
fi
echo 完事
exit
