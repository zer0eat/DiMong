# AI server 포팅 매뉴얼

## 1 : 파이썬 설치

* 파이썬 버전 : 3.9
  
  [파이썬 공식 다운로드](https://www.python.org/downloads/release/python-3913/)

위에서 환경에 맞는 패키지를 다운 받아설치한다.

## 2 : 파이썬 패키지 설치

"AI\AI_API" 다렉토리로 이동 후 다음 명령어 실행

```
pip install -r requirements.txt
```


## 3 : .env 파일 생성
"AI\AI_API\APP" 다렉토리로 이동 후 .env 파일 생성
다음 내용작성
```
API_VERSION=0.1.0
APP_NAME=dimong
DEBUG_MODE=true
```


## 4 : Fast api 실행

"AI\AI_API\APP" 다렉토리로 이동 후 다음 명령어 실행

```
uvicorn main:app --proxy-headers --host 0.0.0.0 --port 8000
