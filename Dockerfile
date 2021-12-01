FROM postgres:14-alpine

RUN apk add openjdk11 libxml2 libxml2-utils
RUN apk fix

ENV POSTGRES_DB=postchain
ENV POSTGRES_USER=postchain
ENV POSTGRES_PASSWORD=postchain

ENV RELL_SRC=src
ENV RUN_XML=config/run.xml

ENV PATH="/usr/src/postchain-node:/usr/src/postchain-scripts:${PATH}"

COPY postchain-node /usr/src/postchain-node
COPY scripts /usr/src/postchain-scripts

ENTRYPOINT ["/usr/src/postchain-scripts/entrypoint.sh"]

STOPSIGNAL SIGINT

CMD ["run"]