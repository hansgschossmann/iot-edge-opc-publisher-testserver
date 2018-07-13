FROM microsoft/dotnet:2.1-sdk

COPY . /build

WORKDIR /build
RUN dotnet restore

WORKDIR /build/iot-edge-opc-publisher-testserver
RUN dotnet publish --framework netcoreapp2.1 --configuration Release --output /build/out iot-edge-opc-publisher-testserver.csproj

EXPOSE 62541

ENTRYPOINT ["dotnet", "/build/out/ConsoleReferenceServer.dll"]
