FROM node:latest

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

ARG PORT=80
ENV PORT $PORT
EXPOSE $PORT

ARG MUSIC_DIR=/music
ENV MUSIC_DIR $MUSIC_DIR

COPY ./entrypoint.sh /entrypoint.sh
RUN chown root:root /entrypoint.sh

WORKDIR /opt/mStream
RUN git clone https://github.com/IrosTheBeggar/mStream.git .

RUN npm install --no-optional && npm cache clean --force && npm link
ENV PATH /usr/local/bin:$PATH

ENTRYPOINT /entrypoint.sh
