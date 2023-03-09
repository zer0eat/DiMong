import os
import imgaug as ia
import imgaug.augmenters as iaa
import numpy as np
from PIL import Image


# 증강할 이미지 폴더 경로
img_dir = "C:\\Users\\SSAFY\\Desktop\\dimongdata\\origindata"

# 증강된 이미지를 저장할 폴더 경로
aug_dir = "C:\\Users\\SSAFY\\Desktop\\dimongdata\\augdata"

# 증강 기법 설정
seq = iaa.Sequential([
    iaa.Resize({"height": 224, "width": 224}),                                      # 이미지 크기 조정
    iaa.CropToAspectRatio(1.0),                                                     # 정사각형 이미지로 크롭
    iaa.Fliplr(0.5),                                                                # 좌우반전
    iaa.Affine(rotate=(-10, 10)),                                                   # 회전
    iaa.Sometimes(0.5, iaa.GaussianBlur(sigma=(0, 3.0))),                           # 가우시안 블러
    iaa.Sometimes(0.5, iaa.AdditiveGaussianNoise(scale=0.1*255)),                   # 가우시안 노이즈
    iaa.Sometimes(0.5, iaa.Add((-10, 10), per_channel=0.5)),                        # 밝기 조절
    iaa.Sometimes(0.5, iaa.Multiply((0.5, 1.5), per_channel=0.5)),                  # 채도 조절
    iaa.Sometimes(0.5, iaa.ContrastNormalization((0.5, 2.0), per_channel=0.5)),     # 대조강화
    iaa.Sometimes(0.5, iaa.Sharpen(alpha=(0, 1.0), lightness=(0.75, 1.5)))          # 샤프닝
])

# 이미지 증강 및 저장
for img_file in os.listdir(img_dir):
    img_path = os.path.join(img_dir, img_file)
    img = Image.open(img_path)
    img = img.convert('RGB') # RGBA 형식을 RGB 형식으로 변경

    for i in range(1, 101):
        img_aug = seq(image=np.array(img))
        aug_file = os.path.splitext(img_file)[0] + "_aug{}.jpg".format(i)
        aug_path = os.path.join(aug_dir, aug_file)
        Image.fromarray(img_aug).save(aug_path)
