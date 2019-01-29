FROM nginx:alpine

RUN apk add --no-cache curl

WORKDIR /usr/share/nginx/html

COPY index.html .

STOPSIGNAL SIGTERM
EXPOSE 80

HEALTHCHECK --interval=5s --timeout=2s --retries=10 \
  CMD curl -q -I --fail localhost || exit 1

CMD ["nginx", "-g", "daemon off;"]
