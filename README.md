# Postchain Image

An example project using the image is provided, see the example directory.

## Usage

The `rell` directory of your dapp, containing `src`, `run.xml` & `config` directory should be mapped to `usr/src/rell` in the container.

```
volumes:
  - ./rell:/usr/src/rell
```

## Persisting blockchain data

If you wish to persist the blockchain data, then make sure to map `/var/lib/postgresql/data` as well.

```
volumes:
  - ./rell:/usr/src/rell
  - ./data:/var/lib/postgresql/data
```
