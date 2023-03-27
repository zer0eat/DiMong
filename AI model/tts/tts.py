from boto3 import Session
from botocore.exceptions import BotoCoreError, ClientError
from contextlib import closing
import os
import sys
import csv
#aws credential 설정 필요
session = Session(profile_name="default")
polly = session.client("polly")
MP3_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)),"mp3")
WAV_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)),"wav")
def tts(text,name):
    try:
    # Request speech synthesis
        response = polly.synthesize_speech(Text=text, OutputFormat="mp3",VoiceId="Seoyeon",LanguageCode="ko-KR",Engine="neural")
    except (BotoCoreError, ClientError) as error:
        # The service returned an error, exit gracefully
        print(error)
        sys.exit(-1)
    if "AudioStream" in response:
        # Note: Closing the stream is important because the service throttles on the
        # number of parallel connections. Here we are using contextlib.closing to
        # ensure the close method of the stream object will be called automatically
        # at the end of the with statement's scope.
            with closing(response["AudioStream"]) as stream:
                output = os.path.join(MP3_DIR, name+'.mp3')
                print(output)
                try:
                    # Open a file for writing the output as a binary stream
                        with open(output, "wb") as file:
                            file.write(stream.read())
                except IOError as error:
                    # Could not write to file, exit gracefully
                    print(error)
                    sys.exit(-1)

    else:
        # The response didn't contain audio data, exit gracefully
        print("Could not stream audio")
        sys.exit(-1)
    #공룡 정보 불러오기
with open('dinodetail.csv', newline='', encoding='cp949') as csvfile:
    details = csv.reader(csvfile)
    i=0
    #공룡 정보 반복문 - polly에 텍스트 입력하고 , 공룡이름 으로 된 음성파일 저장
    for name,detail in details:
        print("name:",name)
        print("detail:",detail)
        tts(text = detail,name = name)
        i+=1
        print("#",i,":finished")