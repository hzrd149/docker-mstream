FROM node:alpine as install

# install git
RUN apk --update add git openssh && \
		rm -rf /var/lib/apt/lists/* && \
		rm /var/cache/apk/*

# clone the repo
WORKDIR /opt/mStream
RUN git clone https://github.com/IrosTheBeggar/mStream.git .

# install node_modules
RUN npm install --no-optional && npm cache clean --force && npm link


FROM node:alpine

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
COPY --from=install /opt/mStream .

ENTRYPOINT /entrypoint.sh
