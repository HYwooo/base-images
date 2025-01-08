FROM hywooo/core-ubuntu-rolling:latest

RUN sudo apt install -y coreutils ca-certificates --quiet --no-install-recommends

RUN zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/aptmirror.sh)"

RUN apt install -y gcc g++ rustup --quiet --no-install-recommends

RUN zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

RUN echo '. "$HOME/.cargo/env"' >> $HOME/.zshrc

RUN echo 'export PATH="$HOME/.cargo/bin:$PATH"' > $HOME/.cargo/env

WORKDIR /root

ENTRYPOINT ["/usr/bin/zsh"] 
