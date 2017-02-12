FROM resin/raspberrypi2-node

# WiringPi
# Install dependencies
# From: https://blog.hypriot.com/post/docker-sensor-fu-on-a-raspberry-pi/
RUN apt-get update && apt-get install -y \
    git-core \
    build-essential \
    gcc \
    python \
    python-dev \
    python-pip \
    python-virtualenv \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN pip install pyserial
RUN git clone git://git.drogon.net/wiringPi
RUN cd wiringPi && ./build
RUN pip install wiringpi2

WORKDIR /usr/src/app

COPY package.json package.json

RUN npm install

COPY . .

CMD modprobe i2c-dev && node index
