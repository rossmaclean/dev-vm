FROM archlinux

# Update system
RUN pacman -Syyu --noconfirm

# Install packages
RUN pacman -S neovim npm sudo git base-devel go python3 jdk-openjdk --noconfirm

ENV USER=ross

# Create user
# Password is 'password' encrypted with 'perl -e 'print crypt($ARGV[0], "password")' 'password''
RUN useradd -G wheel -m $USER -p "papAq5PwY/QQM%"
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER

# Install Yay
RUN git clone https://aur.archlinux.org/yay.git /home/$USER/yay
WORKDIR /home/$USER/yay
RUN makepkg -si --noconfirm
RUN yay -Syyu --noconfirm
WORKDIR /home/$USER
RUN rm -rf /home/$USER/yay

# Install zsh/ohmyzsh
RUN sudo pacman -S zsh --noconfirm
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install NVM
RUN yay -S nvm --noconfirm
RUN echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
RUN echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc

# Install AstroNvim
RUN git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

ENTRYPOINT ["/bin/zsh"]