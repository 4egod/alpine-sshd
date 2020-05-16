FROM alpine
RUN apk update
RUN apk add --no-cache openssh-server
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin\ yes/' /etc/ssh/sshd_config
RUN sed -i 's/AllowTcpForwarding.*/AllowTcpForwarding\ yes/' /etc/ssh/sshd_config
RUN sed -i 's/GatewayPorts.*/GatewayPorts\ yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]