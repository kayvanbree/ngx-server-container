FROM nginx:alpine

# Add angular-server-side-configuration
ADD https://github.com/kyubisation/angular-server-side-configuration/releases/download/v8.0.0/ngssc_64bit /usr/sbin/ngssc
RUN chmod +x /usr/sbin/ngssc

COPY default.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh entrypoint.sh
RUN chmod +x ./entrypoint.sh

EXPOSE 80

CMD ["sh", "entrypoint.sh", "run"]
