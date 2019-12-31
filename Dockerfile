FROM postgres:latest

COPY . .
RUN ["ls", "-R", "build"]

ENV PORT=443

CMD ["echo", "良かったのか?"]