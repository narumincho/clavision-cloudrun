FROM postgres:latest

RUN ["ls", "-R"]

CMD ["echo", "良かったのか?"]