FROM node:20.10

# Install packages needed to build node modules
RUN apt-get update -qq && \
    apt-get install -y pkg-config build-essential curl

WORKDIR /usr/app
ENV NODE_ENV=production
COPY ./ /usr/app

RUN npm ci --include=dev
RUN curl https://static.lamdera.com/bin/lamdera-1.2.0-linux-x86_64 -o /usr/local/bin/lamdera
RUN chmod a+x /usr/local/bin/lamdera
RUN npm run build

