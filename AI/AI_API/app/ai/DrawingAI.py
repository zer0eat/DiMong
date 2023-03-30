

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
MODEL_OR_NOT_DIR = os.path.join(os.path.join(BASE_DIR, "models"), "picture_model_or_not.pth")
MODEL_DIR = os.path.join(os.path.join(BASE_DIR, "models"), "drawing_model.pth")


model_or_not = torch.load(MODEL_OR_NOT_DIR, map_location=torch.device('cpu'))
model = torch.load(MODEL_DIR, map_location=torch.device('cpu'))

model_or_not.eval()
model.eval()

dino_or_not = [-1, "dino"]
dinosaur_names = ['Allosaurus', 'Ankylosaurus', 'Argentinosaurus', 'Brachiosaurus', 'Chasmosaurus', 'Compsognathus', 'Dacentrurus', 'Dilophosaurus', 'Dimorphodon', 'Elasmosaurus', 'Giganotosaurus', 'Iguanodon', 'Incisibosaurus', 'Kentrosaurus', 'Lambeosaurus', 'Mosasaurus', 'Nodosaurus', 'Ouranosaurus', 'Oviraptor', 'Pachycephalosaurus', 'Parasaurolophus', 'Pteranodon', 'Quetzalcoatlus', 'Saurophaganax', 'Spinosaurus', 'Stegosaurus', 'Triceratops', 'Tsintaosaurus', 'Tyrannosaurus', 'Velociraptor']

# 이미지파일 전처리
transformations = transforms.Compose([
    # 해상도를 (224,224)로 맞춰준다
    transforms.Resize((224, 224)),
    # 이미지를 PyTorch의 Tensor로 변환
    transforms.ToTensor(),
    # 이미지의 RGB 채널 값을 평균과 표준편차를 이용하여 정규화
    transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
])

class DrawingAI:
    def __init__(
        self
    ) -> None:
        pass
        
    # 이미지를 읽어 결과를 반환하는 함수
    def get_prediction(self, image_bytes: bytes) -> str:
        # 이미지 바이트 데이터를 입력으로 받아 image에 저장
        image = Image.open(io.BytesIO(image_bytes)).convert('RGB')
        # 저장한 이미지를 전처리(unsqueeze를 이용해 배치 차원을 추가하고, GPU를 사용)
        image = transformations(image).unsqueeze(0).to(device)

        # 모델의 파라미터가 업데이트 되지 않고 연산의 중복을 막아 빠른 결과를 출력
        with torch.no_grad():
            # model에 image를 넣어 예측
            outputs = model_or_not(image)
            # torch.max 함수를 이용해 출력값 중 가장 큰 값을 가지는 인덱스
            _, preds = torch.max(outputs, 1)

            if dino_or_not[preds[0]] == -1:
                return -1
            else:
                # 모델의 파라미터가 업데이트 되지 않고 연산의 중복을 막아 빠른 결과를 출력
                with torch.no_grad():
                    # model에 image를 넣어 예측
                    outputs = model(image)
                    # torch.max 함수를 이용해 출력값 중 가장 큰 값을 가지는 인덱스
                    _, preds = torch.max(outputs, 1)
                
            # dinosaur_names 리스트를 예측 결과의 확률값에 따라 내림차순으로 정렬하고 상위 3개 클래스를 추출
            sorted_indexes = outputs[0].argsort(descending=True)[:3]
            top_3_classes = [dinosaur_names[i] for i in sorted_indexes]

            # 예측한 결과 preds에서 가장 확률이 높은 클래스를 dinosaur_names 리스트에서 찾아 반환
            return top_3_classes

    def exec(self, image: bytes) -> Drawing:
        drawing: Drawing = Drawing()

        # image_bytes를 get_prediction를 통해 분류
        result = self.get_prediction(image) # ["", "", ""]
        
        if result == -1:
            drawing.is_found = False
        else:
            drawing.is_found = True
            drawing.dinosaurName1 = result[0]
            drawing.dinosaurName2 = result[1]
            drawing.dinosaurName3 = result[2]

        return drawing
