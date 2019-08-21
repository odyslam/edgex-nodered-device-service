# edgex-nodered-device-service
An EdgeX device service implemented in Node-Red

## EdgeX Foundry

EdgeX Foundry is a vendor-neutral open source project hosted by The Linux Foundation building a common open framework for IoT edge computing. At the heart of the project is an interoperability framework hosted within a full hardware- and OS-agnostic reference software platform to enable an ecosystem of plug-and-play components that unifies the marketplace and accelerates the deployment of IoT solutions. This repository contains the Go implementation of EdgeX Foundry microservices. It also includes files for building the services, containerizing the services, and initializing (bootstrapping) the services.

### [Repositiry](https://github.com/edgexfoundry/edgex-go) ###

## Node-Red
Node-RED is a programming tool for wiring together hardware devices, APIs and online services in new and interesting ways.

It provides a browser-based editor that makes it easy to wire together flows using the wide range of nodes in the palette that can be deployed to its runtime in a single-click.

### [Repositiry](https://github.com/node-red/node-red) ###


## This service:

This service is in essence a RESTful glue, between a [loraserver.io](https://www.loraserver.io/) app-server and the EdgeX foundry. It implements a device service logic using the REST apis of loraserver and EdgeX foundry.

Node-Red was chosen in order to speedup the development time while focusing solely on the logic of the device-service. The choice brought serious optimisation issues since node-red is considerably heavy (in regards with a simple python flask script that could implement the same functionality). Moreover, the flow-based programming has a learning curve which is not as easy as one would think, making particular difficult the implementatin of multiple rule based flows that would otherwise incur a couple of `if` statements. On the bright side, it is easily implemented and immensely scalable since node.js has amazing scalability properties.

### balena.io
The device service was created to be used in a container on a [balena.io](https://balena.io) Raspberry pi 3, it is a PoC and needs serious optimisation in regards to resource consumption, as also improvement in regards to functionality and error handling. **This repository includes both the Dockerfile needed to build the service as also the docker-compose of the whole project.**

Finally, it implements a subset of the EdgeX foundry device service [specification](https://docs.google.com/document/d/1aMIQ0kb46VE5eeCpDlaTg8PP29-DBSBTlgeWrv6LuYk/edit) and the flow complexity was kept to the minimum.

### KNOWN BUGS

- Lora-App registration can fail, you have to reset loraserver, loraserver app-server databases. Needs to implement smarter registration logic.
