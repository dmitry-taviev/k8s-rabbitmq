FROM rabbitmq:3.6.5-management
MAINTAINER Dmitry Taviev <dmitry.taviev@applyit.lv>

#custom conf
COPY rabbitmq.config /etc/rabbitmq/
COPY .erlang.cookie /var/lib/rabbitmq/

#custom entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh

#persistence
VOLUME /var/lib/rabbitmq/mnesia/