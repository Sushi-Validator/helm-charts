## Introduction

This chart bootstraps a Mina protocol Testnet seed node.

## Add Mina Helm chart repository:

 ```console
helm repo add sushi https://helm.sushivalidator.com
helm search repo sushi
 ```

## Configuration

The following table lists the configurable parameters of the `seed-node` chart and its default values.

### Required Settings

Parameter | Description
--- | ---
`testnetName` | Mina protocol testnet name to deploy to
`seed.discoveryKeyPair` | Key pair used for identifying and connecting to the seed by external clients 

### Optional Settings

Parameter | Description | Default
--- | --- | ---
`seed.active` | Whether to activate client as a Mina protocol seed node | `true`
`seed.fullname` | k8s pod name of seed node to deploy | `seed-node`
`seed.hostPort` | Mina client external port | `10001`
`seed.rpcPort` | Mina client peer communication port | `8301`
`seed.discoveryKeyPair` | Key pair used for identifying and connecting to the seed by external clients 
`mina.image` | container image to use for operating the archive node's Mina daemon | `minaprotocol/mina-daemon:0.0.12-beta-develop-589b507`
`mina.seedPeers` | peers to bootstrap the the archive node's Mina daemon
`mina.runtimeConfig` | Mina daemon configuration to use at runtime | `undefined`

## seed-node launch examples

```console
helm install sushi/seed-node \
    --set testnetName=sushi-net \
    --set seed.discoveryKeyPair=<key-pair>
```
