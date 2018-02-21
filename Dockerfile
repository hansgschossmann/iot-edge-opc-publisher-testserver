FROM microsoft/dotnet:2.0-sdk-jessie

COPY . /build

WORKDIR /build
RUN dotnet restore

WORKDIR /build/ConsoleReferenceServer
RUN dotnet publish --framework netcoreapp2.0 --configuration Release --output /build/out ConsoleReferenceServer.csproj

EXPOSE 62541

ENTRYPOINT ["dotnet", "/build/out/ConsoleReferenceServer.dll"]
