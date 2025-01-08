FROM hywooo/core-ubuntu-rolling:master

RUN zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/aptmirror.sh)"

RUN zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

WORKDIR /root

ENTRYPOINT ["/usr/bin/zsh"] 
