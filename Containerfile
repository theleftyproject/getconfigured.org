FROM codeberg.org/sparkles-sericea/flutter-oci:3.35.1-stable AS stage1
COPY . /app/build/
WORKDIR /app/build/
USER root
RUN flutter pub get && flutter build web

FROM docker.io/joseluisq/static-web-server:2.38.0-alpine AS stage2
WORKDIR /app
COPY --from=stage1 /app/build/web .
EXPOSE 8087
ENTRYPOINT [ "static-web-server", "-p", "8087", "-d", "/app", "-g", "trace" ]