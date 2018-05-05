FROM gitlab/gitlab-ce:latest
MAINTAINER Greg Fullard
USER root

# Update Timezone
ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
