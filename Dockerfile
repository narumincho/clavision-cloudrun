FROM postgres:latest

COPY ./target/release/clavision-cloudrun .
RUN ["ls", "-a"]

ENV PORT=443

CMD ["./clavision-cloudrun"]