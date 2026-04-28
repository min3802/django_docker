# 1. Python이 필요
FROM python:3.12

ENV PYTHONDONTWRITEBYTHECODE=1
ENV PYTHONUNBUFFERED=1

# 2. 작업할 폴더 디렉토리
WORKDIR /code

# 3. 패키지 목록 가져오고 설치하기
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. 코드 가져오기
COPY . .

CMD ["gunicorn", "django_docker.wsgi:application", "--config", "gunicorn.conf.py"]
