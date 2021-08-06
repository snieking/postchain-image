# Postchain Image

An example project using the image is provided, see the example directory.

## Running a node

The `rell` directory of your dapp, containing `src`, `run.xml` & `config` directory should be mapped to `usr/src/rell` in the container.

```
docker run -v $PWD/rell:/usr/src/rell snieking/postchain
```

## Running tests

Tests can be run using the same image.

```
docker run -v $PWD/rell:/usr/src/rell snieking/postchain test
```

By default it will expect and use the `run.xml` located under your rell repository. See the environment variables section if you need to override it.

## Updating the code running

Deploying new config can be done with a simple command.

```
docker exec -i <container_name> update
```

It will deploy a fresh configuration which will be active in 5 blocks. This means that you can easily modify & deploy new code as long as you modify the source that was mapped into the volume.

## Environment variables

| Variable          |    Default     |                              Description |
| ----------------- | :------------: | ---------------------------------------: |
| POSTGRES_DB       |   postchain    |                 Postgres database to use |
| POSTGRES_USER     |   postchain    |                     Postgres user to use |
| POSTGRES_PASSWORD |   postchain    |                 Postgres password to use |
| RELL_SRC          |      src       | Path to src directory from mapped volume |
| RUN_XML           | config/run.xml |       Path to run.xml from mapped volume |

## Persisting blockchain data

If you wish to persist the blockchain data, then make sure to map `/var/lib/postgresql/data` as well.

```
volumes:
  - ./rell:/usr/src/rell
  - ./data:/var/lib/postgresql/data
```
