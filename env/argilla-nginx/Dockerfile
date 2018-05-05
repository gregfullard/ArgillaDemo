FROM nginx
MAINTAINER Greg Fullard

# Update Timezone
ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY argilla /usr/share/nginx/html