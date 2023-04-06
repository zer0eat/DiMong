from boto3 import Session
from botocore.exceptions import BotoCoreError, ClientError
from contextlib import closing
import os
import sys
import csv
import json

#aws credential 설정 필요
session = Session(profile_name="default")
polly = session.client("polly")
MP3_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)),"mp3")
STORY_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)),"story")
WAV_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)),"wav")
def tts(text,name,dir = MP3_DIR):
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
                output = os.path.join(dir, name+'.mp3')
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

def load_dinosaurs() :
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

def find(arr,key,value):
    for i,elem in enumerate(arr):
        if elem[key] == value:
            return i
    return -1

def compress():
    DIR = os.getcwd()
    JSON_PATH = os.path.join(DIR, "stories.json")
    f = open(JSON_PATH, encoding="UTF-8")
    stories = json.loads(f.read())
    f.close()
    list=[]
    for info in stories:
        name = info['name']
        story = rmNewline(info['story'])
        i = find(list,'name',name)
        if(i < 0):
            obj = {
                'name':name,
                'story':[story]
            }
            list.append(obj)
            pass
        else:
            list[i]['story'].append(story)
    return list
    

def load_story():
    stories = compress()
    
    for info in stories:
        for i,story in enumerate(info["story"]):
            filename = info['name']+str(i)
            tts(name=filename,text=rmNewline(story),dir=STORY_DIR)
    pass

def rmNewline(var):
    new_str = var.replace("\n", "")
    return new_str

load_story()