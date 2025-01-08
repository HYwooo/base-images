FROM ubuntu:latest

RUN apt update -y  && apt install -y curl ca-certificates 

RUN curl -sSL https://cdn.jsdelivr.net/gh/HYwooo/install@master/aptmirror | sh

RUN sed -i 's/http:/https:/g' /etc/apt/sources.list.d/ubuntu.sources

RUN apt install -y gcc g++ rustup && \
    mkdir -p ~/.rustup && rustup default stable && \
    mkdir -p ~/.cargo && mkdir -p ~/.cargo/env 

RUN apt install -y git zsh fonts-powerline

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \ 
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/carloscuesta/materialshell.git ~/.oh-my-zsh/custom/themes/materialshell

RUN sed -i 's/^ZSH_THEME=.*/ZSH_THEME="materialshell\/materialshell"/' ~/.zshrc && \
    sed -i 's/^plugins=.*/plugins=(git rust python zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# RUN eval "$(curl https://get.x-cmd.com)" && echo "[ ! -f \"\$HOME/.x-cmd.root/X\" ] || . \"\$HOME/.x-cmd.root/X\" " >> ~/.zshrc
    
RUN echo ". \"\$HOME/.cargo/env\"" >> ~/.zshrc 

RUN chsh -s $(which zsh)

ENTRYPOINT ["/bin/zsh"] 