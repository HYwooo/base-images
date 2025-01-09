FROM hywooo/core-ubuntu-rolling:latest

RUN apt install -y coreutils ca-certificates --quiet --no-install-recommends

RUN "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/mirror-apt.sh)"

RUN "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/install-rust.sh)"

WORKDIR /root

CMD ["/bin/sh"] 
