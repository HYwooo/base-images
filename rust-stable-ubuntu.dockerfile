FROM hywooo/core-ubuntu-rolling:latest

RUN sudo apt install -y coreutils ca-certificates --quiet --no-install-recommends

RUN /usr/bin/zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/aptmirror.sh)"

RUN /usr/bin/zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

WORKDIR /root

ENTRYPOINT ["/usr/bin/zsh"] 
