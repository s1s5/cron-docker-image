FROM s1s5/cron:alpine-curl

ENV TARGET_PATH /
ENV DISK_USAGE_THRESHOLD 80
ENV CRONTABS "*/30 * * * * /opt/check-disk-usage"
ENV ON_SUCCESS "echo ok"
ENV ON_FAILURE "echo ng"

COPY ./check-disk-usage /opt/
