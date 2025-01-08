FROM hywooo/core-ubuntu-rolling:master

RUN sudo apt install -y coreutils ca-certificates --quiet --no-install-recommends

RUN zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/aptmirror.sh)"

RUN apt install -y coreutils ca-certificates gcc g++ rustup --quiet --no-install-recommends

RUN zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

WORKDIR /root

ENTRYPOINT ["/usr/bin/zsh"] 
