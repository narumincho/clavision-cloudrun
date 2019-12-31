FROM postgres:latest

RUN ["ls", "-R"]
COPY  . .

ENV PORT=443

CMD ["echo", "良かったのか?"]