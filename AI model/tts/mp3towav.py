import os
import csv
from pydub import AudioSegment

MP3_DIR = os.path.dirname(os.path.abspath(__file__))+"\\mp3\\"
WAV_DIR = os.path.dirname(os.path.abspath(__file__))+"\\wav\\"

mp3List = os.listdir(MP3_DIR)

with open('dinodetail.csv', newline='') as csvfile:
    details = csv.reader(csvfile)
    i=0
    for name,detail in details:
        # files                                                                         
        src = MP3_DIR+name+".mp3"
        dst = WAV_DIR+name+".wav"
        print(src)
        # convert wav to mp3                                                            
        sound = AudioSegment.from_mp3(src)
        sound.export(dst, format="wav")

