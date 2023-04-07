# git clone https://github.com/ndb796/bing_image_downloader
# pip install --upgrade bing-image-downloader
# 파이썬 3.7 버전

# 디렉토리를 만들기 위해 os 모듈 사용
import os
# 파일 및 디렉토리 작업을 수행(복사, 이동, 이름 바꾸기, 생성, 삭제)하기 위한 함수를 제공
import shutil # shutil == shell utility
# 데이터를 수집하기 위해 이미지 다운로더를 사용
from bing_image_downloader import downloader

# 디렉토리 경로를 저장한 변수
directory_list = [
    './DimongData/',
]

# 초기 디렉토리 만들기
# directory_list를 순회하면서
for directory in directory_list:
    # os.path.isdir()를 사용하여 해당 디렉토리가 할당된 경로가 아니라면
    if not os.path.isdir(directory):
        # os.makedirs()를 사용하여 디렉토리를 생성
        os.makedirs(directory)

# 데이터를 수집하고 학습 데이터와 평가 데이터로 구분하는 함수
def dataset_split(query, train_cnt):  # query 검색어 / train_cnt train에 넣어줄 data의 개수 (나머지는 test로 넣음)
    # directory_list를 순회하면서
    for directory in directory_list:
        # 해당 디렉토리 내에 query(이미지 검색 결과) 이름을 갖는 디렉토리가 없다면
        if not os.path.isdir(directory + '/' + query):
            # query(이미지 검색 결과) 이름을 갖는 디렉토리를 생성한다
            os.makedirs(directory + '/' + query)
    # 학습 및 평가 데이터셋 준비
    cnt = 0   # 데이터를 셀 변수
    # query에서 지정한 경로에 있는 모든 파일을 가져와서 반복한다
    for file_name in os.listdir(query):
        # train_cnt 개수보다 cnt가 작다면 데이터 파일을 train 디렉토리로 이동
        if cnt < train_cnt:
            print(f'[Train Dataset] {file_name}')
            shutil.move(query + '/' + file_name, './DimongData/' + query + '/' + file_name)
        # train_cnt 개수보다 cnt가 크다면 데이터 파일을 test 디렉토리로 이동
        else:
            print(f'[Test Dataset] {file_name}')
            shutil.move(query + '/' + file_name, './DimongData/' + query + '/' + file_name)
        # 데이터의 수 1 추가
        cnt += 1
    # rmtree 함수를 사용하여 query 변수에서 지정한 경로를 삭제(해당 경로에 있는 모든 파일과 디렉토리를 제거)
    shutil.rmtree(query)

# querylist = ["Tyrannosaurus","Triceratops","Velociraptor","Parasaurolophus","Iguanodon","Pteranodon","Ankylosaurus","Argentinosaurus","Pachycephalosaurus","Elasmosaurus"]
# querylist = ["Mosasaurus","Ouranosaurus","Incisibosaurus","Lambeosaurus","Nodosaurus","Oviraptor","Quetzalcoatlus","Kentrosaurus","Spinosaurus","Stegosaurus"]
querylist =  ["Brachiosaurus","Allosaurus","Dilophosaurus","Dimetrodon","Chintaosaurus","Compsognathus","Giganotosaurus","Dimorphodon","Sauropaganax","Chasmosaurus"]
querylist.sort()
print(len(querylist))
print(querylist)
for query in querylist:
    # bing downloader를 이용하여 데이터 저장(query == 검색어, limit= 다운받을 데이터의 수,  output_dir==데이터를 저장할 디렉토리 경로, adult_filter_off==검색결과 필터, force_replace==이미지가 이미 존재할 경우 덮어쓸지 여부, timeout==다운로드 타임아웃 시간 (초))
    downloader.download(query, limit=150, output_dir='./', adult_filter_off=True, force_replace=False, timeout=60, verbose = True)
    # 데이터를 수집하고 학습 데이터와 평가 데이터로 구분하는 함수를 통해 데이터 생성(qeury = 검색어, 숫자 = 데이터 숫자)
    dataset_split(query, 0)