# AI model 포팅 매뉴얼

### 학습용 이미지 데이터 수집

### 1.ImageCrwaling - python v3.7

1. BingCrwaling.py 있는 폴더에서
   
   - `git clone https://github.com/ndb796/bing_image_downloader`

2. clone을 받은 후
   
   - `pip install --upgrade bing-image-downloader`

3. BingCrwaling.py
   
   - `directory_list`에 다운 받을 이미지를 저장할 경로 작성
   
   . `querylist`에 다운 받을 이미지의 검색어 작성
   
   . `downloader.download(query, limit=150, output_dir='./', adult_filter_off=True, force_replace=False, timeout=60, verbose = True)`에서 `limit=0000`에 다운받고 싶은 이미지의 수를 작성하고 파이썬을 실행
   
     . `directory_list` 안에 검색어로 폴더가 생성되고 폴더안에 이미지가 저장

### 2.ImageAugmentation - python v3.6

1. ImageAugmentation_all.py에 있는 폴더에서
   
   - `pip install imgaug`

2. 이미지 경로 작성
   
   - img_dir = 
     
     - 증강시킬 이미지 경로
   
   - aug_dir = 
     
     - 증강시킨 이미지 저장 경로

3. 증강 기법을 주석에 적힌 설명에 따라 원하는 값으로 설정

4. 실행하여 이미지를 증강시킨다





### 이미지 학습 후 모델 저장

### 3.MakeDimongModel.ipynb

1. google colab에 해당 파일을 업로드

2. 데이터 전처리를 통해 데이터 가공을 하여 모델의 성능을 강화하는 과정에서
   
   - data_dir에 데이터를 저장할 경로 저장
     
     - data_dir에 저장된 경로 아래 
       
       - 학습 시킬 데이터는 train 폴더를 만들어 넣고 
         
         - train1 안에 학습시킬 데이터의 라벨이름으로 폴더를 만들어 그 안에 학습 이미지를 넣는다
       
       - 테스트할 데이터는 test 폴더를 만들어 넣는다
         
         - test 안에 학습시킬 데이터의 라벨이름으로 폴더를 만들어 그 안에 학습 이미지를 넣는다

3. 하이퍼 파라미터 설정
   
   - ctrl + F 로 찾기
     
     1. batch_size =
        
        - 미니 배치의 크기 조절
     
     2. lr =
        
        - 학습률 조정
     
     3. num_epochs =
        
        -  학습 반복횟수 설정

4. 주석을 참고하여 실행한다
