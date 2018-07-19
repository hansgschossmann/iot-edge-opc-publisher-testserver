ARG runtime_base_tag=2.1-runtime-alpine
ARG build_base_tag=2.1-sdk-alpine

FROM microsoft/dotnet:${build_base_tag} AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY iot-edge-opc-publisher-testserver/*.csproj ./iot-edge-opc-publisher-testserver/
WORKDIR /app/Server
WORKDIR /app/iot-edge-opc-publisher-testserver
RUN dotnet restore

# copy and publish app
WORKDIR /app
COPY iot-edge-opc-publisher-testserver/. ./iot-edge-opc-publisher-testserver/
COPY Server/. ./Server/
WORKDIR /app/iot-edge-opc-publisher-testserver
RUN dotnet publish -c Release -o out

# start it up
FROM microsoft/dotnet:${runtime_base_tag} AS runtime
WORKDIR /app
COPY --from=build /app/iot-edge-opc-publisher-testserver/out ./
WORKDIR /appdata
COPY --from=build /app/iot-edge-opc-publisher-testserver/Quickstarts.ReferenceServer.Config.xml /appdata
ENTRYPOINT ["dotnet", "/app/iot-edge-opc-publisher-testserver.dll"]