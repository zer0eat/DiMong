# 설치 
# pip install torch
# pip install fastapi
# pip install uvicorn 

# 시작
# uvicorn main:app --reload

import io
import torch
import torchvision.transforms as transforms
from fastapi import FastAPI, File, UploadFile
from fastapi.responses import JSONResponse
from PIL import Image

# GPU가 사용 가능한 경우 cuda를 0으로 초기화하여 사용 / GPU가 사용 불가능한 경우 CPU로 초기화하여 CPU 사용
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu") 
# FastAPI 설정
app = FastAPI()

# dimong 분석모델 load
model = torch.load("models/dimong_model.pth", map_location=torch.device('cpu'))
model.eval()
class_names = ['Iguanodon', 'raptor', 'trex']

# 이미지파일 전처리
transformations = transforms.Compose([
    # 해상도를 (224,224)로 맞춰준다
    transforms.Resize((224, 224)),
    # 이미지를 PyTorch의 Tensor로 변환
    transforms.ToTensor(),
    # 이미지의 RGB 채널 값을 평균과 표준편차를 이용하여 정규화
    transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
])

# 이미지를 읽어 결과를 반환하는 함수
def get_prediction(image_bytes):
    # 이미지 바이트 데이터를 입력으로 받아 image에 저장
    image = Image.open(io.BytesIO(image_bytes))
    # 저장한 이미지를 전처리(unsqueeze를 이용해 배치 차원을 추가하고, GPU를 사용)
    image = transformations(image).unsqueeze(0).to(device)

    # 모델의 파라미터가 업데이트 되지 않고 연산의 중복을 막아 빠른 결과를 출력
    with torch.no_grad():
        # model에 image를 넣어 예측
        outputs = model(image)
        # torch.max 함수를 이용해 출력값 중 가장 큰 값을 가지는 인덱스
        _, preds = torch.max(outputs, 1)
    # 예측한 결과 preds에서 가장 확률이 높은 클래스를 class_names 리스트에서 찾아 반환
    return class_names[preds[0]]


# Define the prediction endpoint

@app.get("/")
def read_root():
    return {"fastapi":"성공"}

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    # 도착한 이미지 바이트 데이터 file로 저장
    image_bytes = await file.read()
    # image_bytes를 get_prediction를 통해 분류
    class_name = get_prediction(image_bytes=image_bytes)
    # 결과 출력
    print("결과:", {'class_name': class_name})
    # 클라이언트에게 json 형태로 돌려줌
    return JSONResponse(content={'class_name': class_name})




