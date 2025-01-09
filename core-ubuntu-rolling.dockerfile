# Use the latest rolling release of Ubuntu as the base image
FROM ubuntu:rolling

# Update the package list and install essential packages (ca-certificates, curl, sudo)
# --quiet: Reduce output noise
# --no-install-recommends: Avoid installing unnecessary recommended packages
RUN apt update -y && apt install -y ca-certificates curl sudo --quiet --no-install-recommends

# Run a custom script to configure apt mirrors for faster package downloads
RUN sh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@latest/mirror-apt.sh)"

# Install Git and Zsh, set Zsh as the default shell, and configure the SHELL environment variable
RUN apt install -y git zsh --quiet --no-install-recommends && chsh -s $(which zsh) && \
    echo "SHELL=$(which zsh)" >>~/.zshrc

# Install Oh My Zsh, a popular framework for managing Zsh configurations
RUN $(which zsh) -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone Zsh plugins for autosuggestions and syntax highlighting into the Oh My Zsh custom plugins directory
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Customize the Zsh configuration:
# 1. Set the Zsh theme to "candy"
# 2. Enable plugins (git, rust, python, zsh-autosuggestions, zsh-syntax-highlighting)
# 3. Set the terminal type to xterm-256color for better color support
RUN sed -i 's/^ZSH_THEME=.*/ZSH_THEME="candy"/' ~/.zshrc && \
    sed -i 's/^plugins=.*/plugins=(git rust python zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc && \
    echo "export TERM=xterm-256color" >>~/.zshrc

# Source the updated .zshrc to apply changes
RUN $(which zsh) -c "source ~/.zshrc"

# Set the working directory to /root
WORKDIR /root

# Set Zsh as the default command when the container starts
CMD ["/usr/bin/zsh"]