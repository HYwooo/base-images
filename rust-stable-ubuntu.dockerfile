FROM hywooo/core-ubuntu-rolling:v0.0.2

RUN sudo apt install -y coreutils ca-certificates --quiet --no-install-recommends

RUN /usr/bin/zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/aptmirror.sh)"

RUN apt install -y gcc g++ rustup --quiet --no-install-recommends

RUN /usr/bin/zsh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

RUN echo '. "$HOME/.cargo/env"' >> $HOME/.zshrc

RUN mkdir -p $HOME/.cargo && echo 'export PATH="$HOME/.cargo/bin:$PATH"' > $HOME/.cargo/env

RUN /usr/bin/zsh -c "source ~/.zshrc"

WORKDIR /root

ENTRYPOINT ["/usr/bin/zsh"] 
