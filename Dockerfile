# Dockerfile
FROM nginx:alpine
RUN addgroup -S appuser && adduser -S appuser -G appuser

COPY . /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -qO- http://localhost/ >/dev/null 2>&1 || exit 1

USER appuser
