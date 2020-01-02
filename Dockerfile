FROM postgres:latest as postgres
FROM node:12.14

COPY ./distribution /distribution

RUN ["ls", "./distribution", "-a"]

ENV PORT=443
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
CMD ["node /distribution/main.js"]