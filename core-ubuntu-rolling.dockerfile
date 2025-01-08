FROM ubuntu:rolling

RUN apt update -y  && apt install -y curl sudo

RUN sh -c "$(curl -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/aptmirror.sh)"

RUN apt install -y git zsh fonts-powerline

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/carloscuesta/materialshell.git ~/.oh-my-zsh/custom/themes/materialshell

RUN sed -i 's/^ZSH_THEME=.*/ZSH_THEME="materialshell\/materialshell"/' ~/.zshrc && \
    sed -i 's/^plugins=.*/plugins=(git rust python zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc && \
    echo "export TERM=xterm-256color" >> ~/.zshrc

RUN chsh -s $(which zsh) 

RUN /usr/bin/zsh -c "source ~/.zshrc"

WORKDIR /root

ENTRYPOINT ["/usr/bin/zsh"] 
