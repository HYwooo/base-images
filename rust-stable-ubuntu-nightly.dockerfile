FROM hywooo/core-ubuntu-rolling:master

RUN apt install coreutils ca-certificates --no-install-recommends -y

RUN sh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/mirror-apt.sh)"

RUN sh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

RUN rustup && rustc && cargo && cargo install lsd && lsd -a

WORKDIR /root

CMD ["/bin/bash"] 
