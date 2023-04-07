from locust import HttpUser, task, between
from PIL import Image
import io

class MyUser(HttpUser):
    # 대기시간 설정
    wait_time = between(1, 2)
    # Locust에서 시뮬레이션할 작업을 정의
    @task
    # 시뮬레이션 중 수행 할 작업의 이름
    def my_task(self):
        # 요청을 보낼 헤더
        headers = {
            "media-type": "multipart/form-data"
        }
        # Image.open() 함수를 사용하여 이미지 객체 열기
        img = Image.open('qq.jpg')
        # io.BytesIO() 함수를 사용하여 BytesIO 객체를 생성

        # BytesIO는 파이썬에서 제공하는 클래스
        # 메모리에 바이너리 데이터를 읽거나 쓰기 위해 사용
        # 파일을 열거나 닫지 않고도 메모리 상에서 파일과 같이 데이터를 읽고 씀
        # 이를 서버로 보내는 경우에는 파일 객체를 사용하는 대신, 해당 BytesIO 객체를 전송 
        # 이렇게 하면 파일을 실제로 디스크에 저장하지 않고도 메모리 상에서 파일 데이터를 처리
        img_bytes = io.BytesIO()
        # BytesIO 객체에 이미지 객체를 JPEG 형식으로 저장
        img.save(img_bytes, format='JPEG')
        # BytesIO 객체의 포인터를 파일의 시작 부분으로 이동
        img_bytes.seek(0)
        # 요청을 보낼 files
        files = {
            "image": ("qq.jpg", img_bytes, "image/jpeg")
        }
        # 요청을 보낼 곳
        with self.client.post("/api/ai/v1/pictures/dinosaurs", headers=headers, files=files, catch_response=True) as response:
            # 응답이 성공일때
            if response.status_code == 200:
                print("Response content:", response)
                response.success()
            # 응답이 실패일 때
            else:
                print(response.status_code)
                response.failure("POST request to /api/ai/v1/pictures/dinosaurs failed")