FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
COPY app /app
WORKDIR /app
RUN dotnet tool install -g x

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=build /app app
COPY --from=build /root/.dotnet/tools tools
ENV ASPNETCORE_URLS http://*:5000
ENTRYPOINT ["/app/tools/x", "app/app.settings"]
