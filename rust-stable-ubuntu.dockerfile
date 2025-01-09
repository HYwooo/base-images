FROM hywooo/core-ubuntu-rolling:latest

RUN $(which zsh) -c "apt install -y coreutils ca-certificates --quiet --no-install-recommends"

RUN $(which zsh) -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/mirror-apt.sh)"

RUN $(which zsh) -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

WORKDIR /root

CMD ["/usr/bin/zsh"] 
