#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

apt update
apt install -y git zsh
git clone https://github.com/zfuns/termux-ohmyzsh.git "~/termux-ohmyzsh" --depth 1

mv "~/.termux" "~/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "~/.termux"

git clone git://github.com/robbyrussell/oh-my-zsh.git "~/.oh-my-zsh" --depth 1
mv "~/.zshrc" "~/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "~/termux-ohmyzsh/.zshrc" "~/.zshrc"
sed -i '/^ZSH_THEME/d' "~/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "~/.zshrc"

git clone git://github.com/zsh-users/zsh-syntax-highlighting.git "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" --depth 1

git clone git://github.com/zsh-users/zsh-autosuggestions "~/.oh-my-zsh/custom/plugins/zsh-autosuggestions" --depth 1

chsh -s zsh

echo "oh-my-zsh install complete!\nChoose your color scheme now~"
$HOME/.termux/colors.sh

echo "Choose your font now~"
$HOME/.termux/fonts.sh

echo "Please restart Termux app..."

exit
