## Introduction

This chart bootstraps a Mina protocol Testnet archive node and associated Postgres database.

## Add Mina Helm chart repository:

 ```console
helm repo add sushi https://helm.sushivalidator.com
helm search repo sushi
 ```

## Configuration

The following table lists the configurable parameters of the `archive-node` chart and its default values.

### Required Settings

Parameter | Description
--- | ---
`testnetName` | Mina protocol testnet name to deploy to
`mina.seedPeers` | peers to bootstrap the the archive node's Mina daemon 
`archive.nodeName` | name identifier of archive node pod

### Optional Settings

Parameter | Description | Default
--- | --- | ---
`archive.image` | container image to use for operating an archive node | `minaprotocol/mina-archive:0.0.12-beta-fix-archive-debs-62bae52`
`archive.postgresHost` | Postgres database host to store archival data | `see [default] values.yaml`
`archive.postgresPort` | Postgres database port | `5432`
`archive.postgresDB` | Postgres database to store archival data | `archive`
`archive.postgresUri` | port on which to listen for data collection requests | `see [default] values.yaml`
`archive.remoteSchemaFile` | archive database schema during initialization | `see [default] values.yaml`
`archive.hostPort` | Kubernetes node port to expose | `10909`
`archive.optionalEnv` | optional environment variable configuration settings | `[]`
`postgres.postgresqlUsername` | Postgress database access username (if set) | `postgres`
`postgres.postgresPassword` | Postgres database access password (if set) | `foobar`
`mina.image` | container image to use for operating the archive node's mina daemon | `minaprotocol/mina-daemon:0.0.14-rosetta-scaffold-inversion-489d898`
`mina.logLevel` | log level to set for mina daemon | `TRACE` 
`mina.logSnarkWorkGossip` | whether the mina daemon should log SNARK work gossip | `false`
`mina.runtimeConfig` | mina daemon configuration to use at runtime | `undefined`
`mina.privKeyPass` | public-private key-pair associated with mina test account/wallet | `see [default] values.yaml`

## archive-node launch examples

```console
helm install sushi/archive-node \
    --set testnetName=sushi-net \
    --set mina.seedPeers=['/dns4/mina-testnet-seed-one.pickles.o1test.net/tcp/10002/p2p/12D3KooWP7fTKbyiUcYJGajQDpCFo2rDexgTHFJTxCH8jvcL1eAH']
```
