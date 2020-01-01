FROM postgres:latest

COPY ./target/release/clavision-cloudrun .
COPY init.sql var/lib/postgresql/data/
RUN ["ls", "-a"]

ENV PORT=443
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
CMD ["./clavision-cloudrun"]