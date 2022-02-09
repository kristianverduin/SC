FROM python:3.6.8-alpine3.8
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev libffi libffi-dev

 
RUN pip install --upgrade pip
# RUN pipenv shell
# RUN pipenv install

WORKDIR .
ENV FLASK_APP=run.py
ENV FLASK_ENV=development
ENV FLASK_RUN_HOST=0.0.0.0
ENV DATABASE_URL=postgres://name:password@host:port/postgresdb
ENV export JWT_SECRET_KEY=hhgaghhgsdhdhdd
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt


# RUN pip install pipenv
# RUN pipenv shell --fancy
# RUN pipenv install
EXPOSE 5000
COPY . .
CMD ["python", "run.py"]
EXPOSE 443
