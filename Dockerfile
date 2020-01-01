FROM postgres:latest

COPY . .
RUN ["echo", "カレントディレクトリを表示する"]
RUN ["pwd"]

ENV PORT=443

CMD ["echo", "良かったのか?"]