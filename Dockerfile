FROM library/python

RUN apt-get update && apt-get install -y git python3-pip

RUN git clone https://github.com/healthchecks/healthchecks.git

WORKDIR ./healthchecks
COPY ./local_settings.py ./hc/

RUN pip3 install -r requirements.txt

RUN ./manage.py migrate
RUN ./manage.py createsuperuser

CMD ./manage.py runserver
