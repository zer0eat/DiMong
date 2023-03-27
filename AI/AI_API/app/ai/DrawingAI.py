

import io
import os
import torch
import torchvision.transforms as transforms

from PIL import Image

from models.DrawingModel import Drawing

# GPU가 사용 가능한 경우 cuda를 0으로 초기화하여 사용 / GPU가 사용 불가능한 경우 CPU로 초기화하여 CPU 사용
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

# dimong 분석모델
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
MODEL_DIR = os.path.join(os.path.join(BASE_DIR, "models"), "drawing_model.pth")

# model = torch.load(MODEL_DIR, map_location=torch.device('cpu'))
# model.eval()
# dinosaur_names = ['Iguanodon', 'raptor', 'trex']

# # 이미지파일 전처리
# transformations = transforms.Compose([
#     # 해상도를 (224,224)로 맞춰준다
#     transforms.Resize((224, 224)),
#     # 이미지를 PyTorch의 Tensor로 변환
#     transforms.ToTensor(),
#     # 이미지의 RGB 채널 값을 평균과 표준편차를 이용하여 정규화
#     transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
# ])




class DrawingAI:
    def __init__(
        self
    ) -> None:
        pass
        
    # 이미지를 읽어 결과를 반환하는 함수
    def get_prediction(self, image_bytes: bytes) -> str:
        pass

    def exec(self, image: bytes) -> Drawing:
        drawing: Drawing = Drawing()
        
        drawing.dinosaurName1 = ""
        drawing.dinosaurName2 = ""
        drawing.dinosaurName3 = ""

        return drawing
