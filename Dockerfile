FROM node:18.18
WORKDIR /usr/app
COPY ./ /usr/app
RUN npm install
RUN curl https://static.lamdera.com/bin/lamdera-1.2.0-linux-x86_64 -o /usr/local/bin/lamdera
RUN chmod a+x /usr/local/bin/lamdera
RUN npm run build

