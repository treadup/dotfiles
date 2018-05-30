FROM ubuntu:18.04

RUN apt update
RUN apt install --yes curl
RUN curl -o install-ubuntu-packages.sh https://raw.githubusercontent.com/treadup/dotfiles/master/computer/install-ubuntu-packages.sh
RUN bash install-ubuntu-packages.sh

CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22 443
