FROM microsoft/dotnet:2.2-sdk-alpine

RUN mkdir /src
COPY . ./src

WORKDIR /src/Pushr.Test

RUN dotnet restore
RUN dotnet build --no-restore

ENTRYPOINT [ "dotnet", "--no-build", "--no-restore" ]