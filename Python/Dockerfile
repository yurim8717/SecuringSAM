 FROM python:3
 
 WORKDIR /app
 ADD primenumberapp.py /
 
 COPY requirements.txt requirements.txt
 RUN pip3 install -r requirements.txt
 
 COPY . .
 
 CMD [ "python", "./primenumberapp.py" ]