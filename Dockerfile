FROM resin/raspberrypi2-alpine-node:5-edge

RUN apk add --no-cache wiringpi

WORKDIR /usr/src/app

COPY package.json package.json

RUN git clone git://git.drogon.net/wiringPi /usr/src/wiringPi && \
    cp /usr/src/wiringPi/wiringPi/*.h /usr/local/include/

RUN npm install

COPY . .

# CMD node index
CMD node wait
