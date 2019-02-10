FROM docker:latest

RUN mkdir /src
COPY . /src
WORKDIR /src

RUN chmod +x publish.sh

RUN ls -l

CMD [ "/src/publish.sh" ]