FROM postgres:latest as postgres
FROM node:12.14

COPY ./package.json /
COPY ./package-lock.json /
COPY ./distribution /distribution
COPY run.bash /
RUN ["npm", "ci"]

ENV PORT=443
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
CMD ["/run.bash"]