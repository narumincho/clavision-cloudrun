FROM postgres:latest

COPY ./target/debug/clavision-cloudrun .
RUN ["ls -a"]

ENV PORT=443

CMD ["./clavision-cloudrun"]