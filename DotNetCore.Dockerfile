FROM microsoft/dotnet:2.2-sdk-alpine

RUN mkdir /src
COPY . /src
WORKDIR /src

RUN chmod +x *.sh

RUN ls -l

CMD [ "/src/unit.tests.sh" ]