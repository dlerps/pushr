###### Building with SKD
FROM microsoft/dotnet:2.2-sdk AS BUILD_ENV

# working on /src
RUN mkdir /src
WORKDIR /src

# Restore & Build
COPY . .
RUN dotnet restore
RUN dotnet build --no-restore -c Release -o build
RUN dotnet publish --no-restore -c Release -o build

###### Executing with Runtime
FROM microsoft/dotnet:2.2-runtime-alpine AS EXEC_ENV

RUN mkdir /app
WORKDIR /app

# Copy app from build environment
COPY --from=BUILD_ENV /src/build .

ENV USR="Pinky"
ENV PASS="World.Domination"
ENV HOSTNAME="localhost:21"
ENV REMOTE_PATH="/tmp"

# Execute
ENTRYPOINT dotnet pushr.dll ${USR} ${PASS} ${HOSTNAME} ${REMOTE_PATH}