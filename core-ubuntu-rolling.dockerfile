FROM ubuntu:rolling

RUN apt update -y && apt install -y curl ca-certificates sudo --quiet --no-install-recommends

RUN $(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/mirror-apt.sh)

RUN apt install -y git zsh --quiet --no-install-recommends && chsh -s /usr/bin/zsh && ln -fs /usr/bin/zsh /bin/sh

RUN $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)

ENV SHELL=/usr/bin/zsh

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

RUN sed -i 's/^ZSH_THEME=.*/ZSH_THEME="candy"/' ~/.zshrc && \
    sed -i 's/^plugins=.*/plugins=(git rust python zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc && \
    echo "export TERM=xterm-256color" >>~/.zshrc

RUN source ~/.zshrc

WORKDIR /root

CMD ["/bin/sh"]
