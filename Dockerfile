FROM postgres:11-alpine

RUN apk add openjdk8

ENV POSTGRES_DB=postchain
ENV POSTGRES_USER=postchain
ENV POSTGRES_PASSWORD=postchain

ENV PATH="/usr/src/postchain-node:/usr/src/postchain-scripts:${PATH}"

COPY postchain-node /usr/src/postchain-node
COPY scripts /usr/src/postchain-scripts

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]

STOPSIGNAL SIGINT

CMD [ "postgres" ]