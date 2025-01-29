FROM hywooo/core-ubuntu-rolling:master

RUN apt install -y coreutils ca-certificates --no-install-recommends --quiet

RUN bash -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/mirror-apt.sh)"

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/HYwooo/install/refs/heads/master/install-rust.sh)" && \
    . $HOME/.cargo/env && \
    rustup --version && \
    rustc --version && \
    cargo --version

RUN cargo install lsd && lsd -a

WORKDIR /root

CMD ["/bin/bash"] 
