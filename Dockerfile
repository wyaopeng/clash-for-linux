FROM debian:12
LABEL authors="wyaopeng"
ENV CLASH_URL='更改为你的clash订阅地址'
ENV CLASH_SECRET=''
WORKDIR /app
COPY . /app
RUN sed -i "s@http://\(deb\|security\).debian.org@http://mirrors.ustc.edu.cn@g" /etc/apt/sources.list.d/debian.sources \
    && apt update \
    && apt -y install  --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /app/start.sh
ENTRYPOINT ["/bin/bash","/app/start.sh"]
