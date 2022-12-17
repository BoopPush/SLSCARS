FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /SlSCarsServerStub
EXPOSE 1111

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /SlSCarsServerStub
COPY --from=build-env /SlSCarsServerStub/out .
ENTRYPOINT ["dotnet", "SlSCarsServerStub.dll"]