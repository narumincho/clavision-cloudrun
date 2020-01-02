FROM postgres:latest as postgres
FROM node:12.14

COPY ./package.json /
COPY ./package-lock.json /
COPY ./distribution /distribution
RUN ["npm", "ci"]

ENV PORT=443
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
CMD ["node /distribution/main.js"]