# iot-edge-opc-publisher-testserver
This OPC UA server is based on the source code of the Console reference server in the [OPC UA .NET Standard github repository](https://github.com/OPCFoundation/UA-.NETStandard) of the OPC Foundation.
The original Console reference server source can be found in the subdirectory ./SampleApplications/Workshop/Reference of the above mentioned repository.

A container is available as [hansgschossmann\iot-edge-opc-publisher-testserver](https://hub.docker.com/r/hansgschossmann/iot-edge-opc-publisher-testserver/) on Docker Hub.

The server can be reached via its endpoint at `opc.tcp://<localhostname>:62541/Quickstarts/ReferenceServer`.

By specifying the commandline option `-a` it accepts automatically all incoming requests from clients (Note: Please be aware of the implied security risk when using this option).

This [repository](https://github.com/hansgschossmann/iot-edge-opc-publisher-testbed.git) contains a docker compose configuration to start up the testbed which is using this server.
