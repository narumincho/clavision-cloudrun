FROM postgres:latest as postgres
FROM node:12.14

ENV APP_ROOT /root/clavision

COPY ./package.json $APP_ROOT/
COPY ./package-lock.json $APP_ROOT/
COPY ./distribution $APP_ROOT/distribution
COPY run.bash $APP_ROOT/
RUN ["npm", "ci"]

ENV PORT=8090
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
CMD ["$APP_ROOT/run.bash"]