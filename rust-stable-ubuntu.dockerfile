FROM hywooo/core-ubuntu-rolling:latest

RUN $(which zsh) -c "apt install -y --no-install-recommends coreutils ca-certificates "

RUN $(which zsh) -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@latest/mirror-apt.sh)"

RUN $(which zsh) -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@latest/install-rust.sh)"

WORKDIR /root

CMD ["/usr/bin/zsh"] 
