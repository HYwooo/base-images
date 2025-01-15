FROM hywooo/core-ubuntu-rolling:master

RUN $(which zsh) -c "apt install coreutils ca-certificates rustup --no-install-recommends -y"

RUN $(which zsh) -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/mirror-apt.sh)"

RUN $(which zsh) -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

RUN $(which zsh) -c "rustup && rustc && cargo"

WORKDIR /root

CMD ["/usr/bin/zsh"] 
