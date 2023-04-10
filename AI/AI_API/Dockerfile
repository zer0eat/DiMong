FROM python:3.9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
# COPY . /code/

RUN pip install --upgrade pip && pip install --no-cache-dir --upgrade -r /code/requirements.txt

# CMD ["pwd"]

COPY ./app/ /code/app/

# CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8000"]