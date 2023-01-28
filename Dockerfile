FROM archlinux

# Update system
RUN pacman -Syyu --noconfirm

# Install packages
RUN pacman -S neovim npm sudo git base-devel go --noconfirm

# Create user
RUN useradd -G wheel -m ross -p pass
RUN echo "ross ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ross

# Install Yay
RUN git clone https://aur.archlinux.org/yay.git /home/ross/yay
WORKDIR /home/ross/yay
RUN makepkg -si --noconfirm
RUN yay -Syyu --noconfirm

# Install NVM
RUN yay -S nvm --noconfirm
RUN echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
RUN echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc

# Install AstroNvim
RUN git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
RUN sed -i 's/-- ensure_installed = { "sumneko_lua" },/ensure_installed = { "pyright" }/' /home/ross/.config/nvim/lua/user_example/init.lua

# TODO: Install zsh/ohmyzsh