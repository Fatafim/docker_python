FROM python:3.11-slim
WORKDIR /app
COPY . .
RUN pip install --trusted-host pypi.python.org -r requirements.txt
EXPOSE 8080
VOLUME /app/data
CMD ["python", "main.py"]
