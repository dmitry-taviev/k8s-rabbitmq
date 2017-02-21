FROM rabbitmq:3.6.5-management
MAINTAINER Dmitry Taviev <dmitry.taviev@applyit.lv>

#custom conf
COPY rabbitmq.config /etc/rabbitmq/
COPY .erlang.cookie /var/lib/rabbitmq/
RUN chmod 600 /var/lib/rabbitmq/.erlang.cookie

#custom entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh

#persistence
VOLUME /var/lib/rabbitmq/mnesia/