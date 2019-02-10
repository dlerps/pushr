FROM microsoft:dotnet:2.2-sdk-alpine

RUN mkdir /src
COPY . /src
WORKDIR /src

RUN chmod +x unit.tests.sh

ENTRYPOINT [ "unit.tests.sh" ]