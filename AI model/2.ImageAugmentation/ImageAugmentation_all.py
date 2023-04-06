import os
import imgaug as ia
import imgaug.augmenters as iaa
import numpy as np
from PIL import Image


# 증강할 이미지 폴더 경로
img_dir = "C:\\Users\\SSAFY\\Desktop\\연습\\오리진"

# 증강된 이미지를 저장할 폴더 경로
aug_dir = "C:\\Users\\SSAFY\\Desktop\\연습\\증강"

# 증강 기법 설정
seq = iaa.Sequential([
    # [이미지 크기 조정]
    iaa.Resize({"height": 224, "width": 224}),
    # [크롭] - 정사각형 이미지
    iaa.CropToAspectRatio(1.0),
    # [좌우반전] 50% 확률로 적용
    iaa.Fliplr(0.5),                                                                
    # [회전] 50% 확률 적용 - (-180, 180도까지 이미지 회전 / -16에서 16도까지 전단 / x y축을 50~150% 값으로 조정)
    iaa.Sometimes(0.5, iaa.Affine(rotate=(-180, 180), shear=(-16, 16), scale={"x": (0.5, 1.5), "y": (0.5, 1.5)})),
    # [색반전] 25% 확률로 적용 - (50%는 RGB 채널마다 다른 값 적용 / 나머지 50%는 같은 값 적용)
    iaa.Invert(0.25, per_channel=0.5),
    # [솔라라이즈] - 25% 확률로 적용 (임계값 32와 128사이의 값이 아니라면 임의의 수로 대체)
    iaa.Solarize(0.25, threshold=(32, 128)),
    # [대조강화] 50% 확률로 적용 
    iaa.Sometimes(0.5, iaa.ContrastNormalization((0.5, 2.0), per_channel=0.5)),
    # [샤프닝] 50% 확률로 적용 - (이미지를 선명하게 만들어줌 / alpha==0(블러)~1(선명) / lightness, 기본값(1))
    iaa.Sometimes(0.5, iaa.Sharpen(alpha=(0, 1.0), lightness=(0.75, 1.5))),
    # [밝기대비조절-선명도] 30% 확률로 적용 - (밝기대비를 조절하여 선명도 증가 / 0.75 ~ 1.5 배하여 밝기대비 조절)
    iaa.Sometimes(0.3, iaa.LinearContrast((0.75, 1.5))),
    # [클라헤] 10% 확률로 적용 - (clip_limit==각 블록에서의 최대 빈도수 제한(1~10사이) / 50%는 RGB 채널마다 다른 값 적용 / 나머지 50%는 같은 값 적용))
    iaa.Sometimes(0.1, iaa.AllChannelsCLAHE(clip_limit=(1, 10), per_channel=0.5)),
    # [경계선강조] 10% 확률로 적용 - (alpha==에지 강도의 스케일을 조절(1에 가까울수록 약한 엣지)
    iaa.Sometimes(0.1, iaa.EdgeDetect(alpha=(0.0, 1.0))),
    # [케니경계선강조] 10% 확률로 적용 - (alpha==이미지에 노이즈를 추가 / sobel_kernel_size==sobel kernel의 크기(3~7사이 랜덤))
    iaa.Sometimes(0.1, iaa.Canny(alpha=(0.5, 1.0), sobel_kernel_size=[3, 7])),

    # [픽셀조절-더하기] 30% 확률로 적용 - 이미지의 픽셀 값에 (-10, 10)의 정수 값을 더해 증강(50%는 RGB 채널마다 다른 값 적용 / 나머지 50%는 같은 값 적용)
    iaa.Sometimes(0.3, iaa.Add((-10, 10), per_channel=0.5)),
    # [픽셀조절-곱하기] 30% 확률로 적용 - 이미지(전체 적용)의 픽셀 값에 (0.5, 1.5)의 정수 값을 곱해 증강(50%는 RGB 채널마다 다른 값 적용 / 나머지 50%는 같은 값 적용)
    iaa.Sometimes(0.3, iaa.Multiply((0.5, 1.5), per_channel=0.5)),
    # [픽셀조절-픽셀마다곱하기] 30% 확률로 적용 - 이미지(픽셀마다 적용)의 픽셀 값에 (0.5, 1.5)의 정수 값을 곱해 증강(50%는 RGB 채널마다 다른 값 적용 / 나머지 50%는 같은 값 적용)
    iaa.Sometimes(0.3, iaa.MultiplyElementwise((0.5, 1.5), per_channel=0.5)),
    # [색상 픽셀로 가리기] 7% 확률로 적용 - (nb_iterations==1~5개 중 랜덤 생성 / size==전체 사이즈의 20%크기의 박스생성 / squared=False (True면 정사각형으로 가리기 /False면 사각형으로 가리기 / fill_mode="constant"(박스의 영역 전체 설정) / cval=(0, 255)(박스의 색을 0부터 255 사이의 색으로 랜덤지정) / fill_per_channel=0.5(채널마다 적용))
    iaa.Sometimes(0.7, iaa.Cutout(nb_iterations=(1, 5), size=0.2, squared=False, fill_mode="constant", cval=(0, 255), fill_per_channel=0.5)),
    # [가우시안 픽셀로 가리기] 2% 확률로 적용 - (nb_iterations==1~5개 중 랜덤 생성 / size==전체 사이즈의 20%크기의 박스생성 / squared=False (True면 정사각형으로 가리기 /False면 사각형으로 가리기 / fill_mode="gaussian"(박스의 영역을 가우시안 노이즈로 채움) / fill_per_channel=0.5(채널마다 적용))
    iaa.Sometimes(0.02, iaa.Cutout(nb_iterations=(1, 5), size=0.2, squared=False, fill_mode="gaussian", fill_per_channel=0.5)),

    # [픽셀조절- 블록탈락] 10% 확률 적용 - (p==20% 확률로 픽셀 제거 / per_channel==채널마다 다르게 적용)
    iaa.Sometimes(0.1, iaa.Dropout(p=(0, 0.2), per_channel=0.5)),
    # [픽셀조절- 큰블록탈락] 10% 확률 적용 - (0~5% 확률로 픽셀 제거 / size_percent==탈락할 크기 설정 / per_channel==채널마다 다르게 적용)
    iaa.Sometimes(0.1, iaa.CoarseDropout((0.0, 0.05), size_percent=(0.02, 0.25), per_channel=0.5)),
    # [픽셀조절- 채널삭제] 10% 확률 적용 - (채널 중 50% 확률로 0으로 값 변경) ## nb_keep_channels==를 설정하여 채널삭제가 일어나지 않을 채널의 수 설정 가능
    iaa.Sometimes(0.1, iaa.Dropout2d(p=0.5)),
    # [슈퍼픽셀] 10% 확률로 적용 - (32 슈퍼픽셀로 50% 확률로 변경)
    iaa.Sometimes(0.1, iaa.Superpixels(p_replace=0.5, n_segments=32)),

    # [가우시안 노이즈] 50% 확률로 적용 - (정규분포에 따른 랜덤 노이즈(실제 세계의 물체에서 발생하는 노이즈 모사) / 중앙값 근처에서 발생 / 픽셀마다 독립적) - 픽셀마다 노이즈 생성(loc 평균값을 0으로 지정해서 노이즈가 양수 음수 골고루 생성하게 함 / scale 값에 따라 픽셀에 적용할 노이즈 적용(0부터 scale까지 값 중 랜덤 적용) / per_channel로 채널마다 무작위로 노이즈 추가하여 다양성을 높여 일반화 성능 향상)
    iaa.Sometimes(0.5, iaa.AdditiveGaussianNoise(loc=0, scale=0.1*255), per_channel=0.5),
    # [라플라스 노이즈] 5% 확률로 적용 - (라플라스 분포에 따른 랜덤 노이즈(비교적 드물게 발생하는 이상치 노이즈 모사) / edge 정보 이미지 처리에 유리 / 픽셀마다 독립적) - 픽셀마다 노이즈 생성(scale 값에 따라 픽셀에 적용할 노이즈 적용(0부터 scale까지 값 중 랜덤 적용) / per_channel로 채널마다 무작위로 노이즈 추가하여 다양성을 높여 일반화 성능 향상)
    iaa.Sometimes(0.05, iaa.AdditiveLaplaceNoise(scale=(0, 0.2*255)), per_channel=0.5),
    # [푸아송 노이즈] 2% 확률로 적용 - (불규칙한 사건 발생을 반영한 노이즈 / 이미지 밝기가 낮을 때 발생 / 양자화 장치에서 발생하는 노이즈) - 픽셀마다 노이즈 생성(scale 값에 따라 픽셀에 적용할 노이즈 적용(0부터 scale까지 값 중 랜덤 적용) / per_channel로 채널마다 무작위로 노이즈 추가하여 다양성을 높여 일반화 성능 향상)
    iaa.Sometimes(0.02, iaa.AdditivePoissonNoise(scale=(0, 40)), per_channel=0.5),
    # [소금과 후추 노이즈] 2% 확률로 적용 - (10%를 노이즈로 대체 / 50% 확률로 각 채널마다 적용)    
    iaa.Sometimes(0.02, iaa.SaltAndPepper(0.1, per_channel=0.5)),

    # [카툰화] 30% 확률로 적용 - (blur_ksize==경계선강조를 위한 블러링 크기, 기본값(3) / segmentation_size==수행할 영역의 크기 작을수록 경계선 강조 / saturation==채도조절, 기본값(2) / edge_prevalence 경계선 강조의 세기, 기본값(1))
    iaa.Sometimes(0.3, iaa.Cartoon(blur_ksize=3, segmentation_size=1.0, saturation=2.0, edge_prevalence=1.0)),

    # [블러] 30% 확률로 적용 - (BlendAlpha==입력 이미지와 랜덤으로 생성 된 알파 맵 (불투명도 맵)을 사용하여 두 이미지를 혼합하는 작업을 수행 [알파의불투명도값(0.25~0.75), 블렌딩할 이미지] / MedianBlur==이미지의 픽셀 값을 정렬하여 중간값을 사용하여 해당 위치의 값을 대체(필터의크기)
    iaa.Sometimes(0.3, iaa.BlendAlpha([0.25, 0.75], iaa.MedianBlur(14))),
    # [가우시안 블러] 50% 확률로 적용 - (이미지 대비의 강화 및 약화(sigma 값에 따라 강하고 약한 블러 적용(0.0~3.0 랜덤 적용))
    iaa.Sometimes(0.5, iaa.GaussianBlur(sigma=(0, 3.0))),
    # [모션 블러] 10% 확률로 적용 - (14의 커널 크기로 모션 블러를 이미지에 적용 / 각도는 -45~45 사이로 무작위)
    iaa.Sometimes(0.1, iaa.MotionBlur(k=14), angle=[-45, 45]),

    # [날씨-안개] 10% 확률로 적용 - 안개
    iaa.Sometimes(0.1, iaa.Fog()),
    # [날씨-눈] 10% 확률로 적용 - 눈
    iaa.Sometimes(0.1, iaa.Snowflakes(flake_size=(0.1, 0.4), speed=(0.01, 0.05))),
    # [날씨-눈쌓임] 10% 확률로 적용 - 높은지형에 눈이 쌓인 것을 표시 (lightness_threshold==임계값 사이의 값이 아니라면 임계값 내 숫자로 변경 / lightness_multiplier==밝기 값에 대한 스케일링 값)
    iaa.Sometimes(0.1, iaa.FastSnowyLandscape(lightness_threshold=(100, 255), lightness_multiplier=(1.0, 4.0))),
    # [날씨-비] 10% 확률로 적용 - 비
    iaa.Sometimes(0.1, iaa.Rain(speed=(0.1, 0.3))),
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
