FROM microsoft/dotnet:2.2-sdk AS BUILD_ENV

ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

RUN mkdir /out
RUN mkdir /build
WORKDIR /build

COPY ./Pushr/Pushr.csproj .

RUN dotnet restore

COPY ./Pushr ./

RUN dotnet build --no-restore
RUN dotnet publish --no-restore -o /out



FROM microsoft/dotnet:2.2-runtime-alpine AS RUN_ENV

ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

RUN mkdir /app
WORKDIR /app

COPY --from=BUILD_ENV /out ./

ENTRYPOINT [ "dotnet", "Pushr.dll" ]