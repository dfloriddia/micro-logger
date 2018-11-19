FROM microsoft/dotnet:2.1.1-aspnetcore-runtime

ARG app

WORKDIR c:\\microAREAservice

ENV MICROAREA_APP_NAME=$app.dll
ENV WORKDIR=c:\\microAREAservice\\wwwroot
ENV CLOUDCONSOLEAPIURL=http://localhost
ENV GWAMAPIURL=http://localhost
ENV MICROLOGINURL=http://localhost
ENV MICROACCOUNTSURL=http://localhost
ENV MICROLOGGERURL=http://localhost
ENV JSONFILENAME=environment.settings.json

COPY . .

SHELL ["powershell", "-Command"]
ENTRYPOINT ./replaceandstart.ps1