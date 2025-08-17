FROM docker.io/library/debian:13.0 AS stage1

# install required dependencies
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y curl git unzip zip xz-utils libglu1-mesa
# install flutter
RUN curl -fLO https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.35.1-stable.tar.xz /opt
RUN tar -xf /opt/flutter_linux_3.35.1-stable.tar.xz -C /opt && rm /opt/flutter_linux_3.35.1-stable.tar.xz && \
    git config --global --add safe.directory /opt/flutter
ENV PATH="$PATH:/opt/flutter/bin"
COPY . /app/build/
WORKDIR /app/build/
USER lefty
RUN flutter pub get && flutter build web

FROM docker.io/joseluisq/static-web-server:2.38.0-alpine AS stage2
WORKDIR /app
COPY --from=stage1 /app/build .
EXPOSE 8087
ENTRYPOINT [ "static-web-server", "-p", "8087", "-d", "/app", "-g", "trace" ]