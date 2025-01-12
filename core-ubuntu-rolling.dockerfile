# Use the latest rolling release of Ubuntu as the base image
FROM ubuntu:rolling

# Update the package list and install essential packages (ca-certificates, curl, sudo)
RUN apt update -y && apt install -y sudo ca-certificates curl --quiet --no-install-recommends

# Run a custom script to configure apt mirrors for faster package downloads
RUN sh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@latest/mirror-apt.sh)"

# Install Git and Zsh, set Zsh as the default shell, and configure the SHELL environment variable
RUN sh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@latest/install-zsh.sh)"

# Source the updated .zshrc to apply changes
RUN $(which zsh) -c "source ~/.zshrc"

# Set the working directory to /root
WORKDIR /root

# Set Zsh as the default command when the container starts
CMD ["/usr/bin/zsh"]
