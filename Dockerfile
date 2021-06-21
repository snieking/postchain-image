FROM postgres:11-alpine

#USER postgres

# Create postgresql socket folder
#RUN mkdir /run/postgresql
#RUN chown postgres:postgres /run/postgresql/

# Create the data directory, and make it less permissive 
#RUN mkdir /var/lib/postgresql/data
#RUN chmod 0700 /var/lib/postgresql/data

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