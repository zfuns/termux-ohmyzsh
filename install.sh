#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

apt update
apt install -y git zsh

git clone https://github.com/zfuns/termux-ohmyzsh.git "$HOME/termux-ohmyzsh"

# mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"

git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
#mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/termux-ohmyzsh/.zshrc" "$HOME/.zshrc"
#sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
#sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

chsh -s zsh

echo "[ oh-my-zsh ] 安装完成！!\n现在选择您的配色方案~"
$HOME/.termux/colors.sh

echo "现在选择你的字体~"
$HOME/.termux/fonts.sh

echo "请重启Termux应用程序..."

exit
