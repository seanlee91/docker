#
# Dockerfile for ddns
#

FROM seanlee220/docker
LABEL maintainer="seanlee <seanlee91220@126.com>"

COPY ./*.sh /app/

WORKDIR /app/

ENV Time="* 5 * * *"
ENV Script="qcloud"
ENV ApiId="LTAI1xuw8FXYGPPX"
ENV ApiKey="APOC6SaQ8c9d6LnuClcLhnHFLN2zOf"
ENV Domain="smilesean.top"
ENV SubDomain="www"


RUN	apk add --no-cache wget ca-certificates openssl && \
	chmod +x /app/*.sh && \
	touch /app/cron.log

CMD "/app/$Script.sh" && echo "$Time /app/$Script.sh" > /etc/crontabs/root && crond -f
