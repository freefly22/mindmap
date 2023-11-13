#拉取基础镜像
FROM busybox:1.35.0-uclibc
#拉取项目源文件
RUN wget https://github.com/wanglin2/mind-map/archive/refs/heads/main.zip
    && unzip main.zip
    && rm main.zip
#定义工作目录
WORKDIR /app/mind-map-main
#复制主要文件到docker
COPY index.html .
COPY dist dist
#暴露端口
EXPOSE 80
#运行http服务
CMD ["httpd", "-f",  "-h", "/app"]
