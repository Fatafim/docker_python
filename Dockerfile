# Use an official Windows ServerCore as a parent image
FROM mcr.microsoft.com/windows/servercore:10.0.14393.1066_ru-ru


# Install Python
ADD https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe / 
RUN python-3.9.5-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

# Make sure pip is updated
RUN python -m pip install --upgrade pip

# Set the working directory in the Docker image
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80


# Run app.py when the container launches
CMD ["python", "main.py"]