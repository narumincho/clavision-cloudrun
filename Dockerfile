FROM postgres:latest

COPY ./distribution ./distribution

RUN curl -sL https://rpm.nodesource.com/setup_12.14 | bash -
RUN ["ls", "-a"]

ENV PORT=443
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
CMD ["node ./distribution/main.js"]