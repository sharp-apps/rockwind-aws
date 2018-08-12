FROM microsoft/dotnet:2.1-aspnetcore-runtime
COPY web /web
ADD https://raw.githubusercontent.com/NetCoreWebApps/Rockwind.Aws/master/app/web.settings /web/web.settings
WORKDIR /web
EXPOSE 5000/tcp
ENV ASPNETCORE_URLS http://*:5000
ENTRYPOINT ["dotnet", "/web/app.dll"]