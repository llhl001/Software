# Dockerfile 基本概念
# Dockerfile 中每一条指令都独立运行，并创建出一个新的镜像，所以 RUN cd /tmp 指令不会改变下一条指令的工作目录


# syntax = example.com/user/repo:tag@sha256:abcdef...
# escape = \

# 下载演示案例
# shell> cd /opt/Git/LocalRepository
# shell> git clone https://github.com/dockersamples/node-bulletin-board
# shell> cd node-bulletin-board/bulletin-board-app


# ARG 唯一可以放在 FROM 指令前面的指令
ARG  CODE_VERSION=latest


# 继承 DockerHub 中的 node:current-slim 镜像
# FROM [--platform=<platform>] <image> [AS <name>]
# FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]
# FROM [--platform=<platform>] <image>[@<digest>] [AS <name>]
FROM node:current-slim

# 设置环境变量，以供其他位置使用，调用方式 ${foo}
ENV foo /aaa
# 注意这里的 ksf 最终值为 /aaa 而不是 /bbb，因为 环境变量是直接替换整个 instruction，而不是一步步执行的
ENV foo=/bbb ksf=${foo}

# 指定镜像中所有后续操作的工作目录
WORKDIR /usr/src/app1

# 将当前 Dockerfile 所在的目录中的 package.json 复制到 /usr/src/app1 目录下
COPY package.json

# 在镜像中执行 npm install 命令，该命令会读取 package.json 文件，解析依赖关系，并安装依赖 
RUN npm install

# 表示 Docker 容器在运行时监听 8080 端口，默认 tcp
EXPOSE 8080/tcp
EXPOSE 8080/udp


# 没仔细看的
LABEL
ADD
ENTRYPOINT
VOLUME
USER
ONBUILD
STOPSIGNAL
HEALTHCHECK
SHELL


# 在容器中运行指定的命令，CMD 最多只能出现一次
CMD [ "npm", "start" ]

# 赋值 Dockerfile 文件所在目录下的所有文件到 /usr/src/app1 下
COPY . .
