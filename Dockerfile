FROM nginx:1.27.5-alpine

WORKDIR /web_server

COPY script.sh .
RUN chmod +x script.sh

CMD ["/web_server/script.sh"]