FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV PYTHON_VERSION 3.8.12

RUN Invoke-WebRequest "https://www.python.org/ftp/python/$env:PYTHON_VERSION/python-$env:PYTHON_VERSION-amd64.exe" -OutFile "python-installer.exe" -UseBasicParsing ; \
    Start-Process python-installer.exe -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait ; \
    Remove-Item python-installer.exe

WORKDIR /app
COPY . .
RUN pip install --trusted-host pypi.python.org -r requirements.txt
EXPOSE 8080
CMD ["python", "main.py"]
