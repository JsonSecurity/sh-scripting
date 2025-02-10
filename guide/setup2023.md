# 1. Actualizar, almacenamiento y Verbose

apt update
apt upgrade
termux-setup-storage
touch .hushlogin

# 2. Instalaciones

pkg install git micro zsh bat lsd -y

# 3. Instalar oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 4. Instalar Power level 10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

• Abrir una nueva terminal y configura
• Para volver a configurar 

p10k configure

# 5. Instalar autosuggestions

mkdir -p ~/.plugins/zsh-autosuggestions

git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.plugins/zsh-autosuggestions; echo "source ~/.plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc

• Recargar la configuración de termux

termux-reload-settings

# 6. Instalar highlighting

mkdir -p ~/.plugins/zsh-syntax-highlighting

git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.plugins/zsh-syntax-highlighting; echo "source ~/.plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

termux-reload-settings

# 7. Macro - extra keys

extra-keys = [['ESC','|','-', {key: HOME, display: 'INC'},'UP',{key: END, display: 'FIN'}, 'APOSTROPHE', {macro: "clear ENTER", display: '×'}],['TAB','CTRL','BACKSLASH','LEFT','DOWN','RIGHT','KEYBOARD','DEL'] ]

• Reinicia termux

# 8. Configuración de colores

cd .termux
touch colors.properties
micro colors.properties

# - Código a copiar 

color0=#303030
#Red
color1=#a87139
#line green
color2=#6AEB36
color3=#71a839
color4=#7139a8
color5=#a83971
color6=#3971a8
color7=#8a8a8a
#black
color8=#494949
#Red Terminal
color9=#EE146F
color10=#3bb076
color11=#76b03b
#Carpetas
color12=#6F6FFC
color13=#b03b76
color14=#3b76b0
color15=#cfcfcf
background=#1A1A1E
foreground=#d9e6f2
cursor=#d9e6f2

#- Fin de código 
# - Código 2

color0=#303030

#Red
color1=#8B0000
#line green
color2=#6AEB36
#yelloy
color3=#F5B337
#blue
color4=#6F7CEF
#pink
color5=#F537C2
#cyan
color6=#31DEEF
#lead
color7=#8a8a8a
#black
color8=#494949
#Red Terminal
color9=#EE146F
#green
color10=#4FDA15
#yellow
color11=#F4C82D

#Carpetas
color12=#6F6FFC
#mutimedia
color13=#b03b76
#cyan
color14=#13CDAF
#lead
color15=#cfcfcf

background=#1A1A1E
foreground=#d9e6f2
cursor=#d9e6f2

# - Fin código 

termux-reload-settings
