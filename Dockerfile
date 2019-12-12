FROM centos:centos7

MAINTAINER kis.chuan@gmail.com

RUN yum install -y git curl wget vim zsh
RUN /usr/bin/cp /etc/localtime /etc/localtime_bak && /usr/bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN echo /root/.oh-my-zsh/plugins/zsh-autosuggestions
RUN git clone git://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/plugins/zsh-autosuggestions
RUN sed -i  "/^plugins=/c plugins=(git zsh-autosuggestions)" ~/.zshrc
RUN sed -i 's/fg=8/fg=red/g' /root/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

WORKDIR /root
CMD ["chsh", "-s", "/bin/zsh"]
