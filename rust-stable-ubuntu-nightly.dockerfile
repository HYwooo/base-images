FROM hywooo/core-ubuntu-rolling:master

RUN apt install -y coreutils ca-certificates --no-install-recommends --quiet

RUN bash -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/mirror-apt.sh)"

RUN bash -c  "$(curl -fsSL https://raw.githubusercontent.com/HYwooo/install/refs/heads/master/install-rust.sh)"

RUN bash -c 'rustup && rustc && cargo && cargo install lsd && lsd -a'

WORKDIR /root

CMD ["/bin/bash"] 
