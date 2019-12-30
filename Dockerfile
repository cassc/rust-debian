FROM rustlang/rust:nightly-stretch-slim
ENV CACHE_REFRESH_AT=2019-12-20
RUN  apt-get update
RUN  apt-get install -y apt-transport-https
COPY stretch.source.list /etc/apt/sources.list
RUN  apt-get update
RUN  apt-get install -y default-libmysqlclient-dev libsqlite3-dev
RUN  echo 'export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup' >> /etc/profile
COPY .cargo/ /.cargo/
RUN  cargo install diesel_cli --no-default-features --features mysql --features sqlite



