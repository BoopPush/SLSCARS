FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /SLSCarsServerStub
EXPOSE 1111

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["SlSCarsServerStub.csproj", "./"]
RUN dotnet restore "./SlSCarsServerStub.csproj"
COPY . .
RUN dotnet build "SlSCarsServerStub.csproj" -c Release -o /SLSCarsServerStub

FROM build AS publish
RUN dotnet publish "SlSCarsServerStub.csproj" -c Release -o /SLSCarsServerStub

FROM base AS final
WORKDIR /SLSCarsServerStub
COPY --from=publish /SLSCarsServerStub .
ENTRYPOINT ["dotnet", "SlSCarsServerStub.dll"]