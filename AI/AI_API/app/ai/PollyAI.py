from models.DinosaursModel import Dinosaurs
from boto3 import Session
from botocore.exceptions import BotoCoreError, ClientError
from contextlib import closing
import os
import sys
import subprocess
from tempfile import gettempdir

dinosaurDetail = {
    "Tyrannosaurus": "수각류인 티라노사우루스는 가장 잘 알려진 공룡으로써 티라노사우루스라는 이름의 의미는 ‘폭군 도마뱀’이라는 의미를 가지고 있습니다. 수각류인 티라노사우루스는 날카로운 원뿔형 이빨(정단면이 ‘D’자-모양)을 가지고 있으며 길고 잘 발달된 뒷다리와 강한 근육으로 포식자 중 최고의 포식자였습니다.티라노사우루스는 트리케라톱스의 뼈를 부수고 쪼갤 정도로 무서운 이빨을 가지고 있습니다. 티라노사우루스가 무는 힘은 사자보다 15배나 강합니다. 또한 뛰어난 후각을 지녔기 때문에 시체도 사양하지 않고 먹었을 것으로 추정됩니다.많은 초식공룡의 뼈에 남은 티라노사우루스의 이빨 자국을 확인 할 수 있습니다.티라노사우루스의 이빨은 알로사우루스의 이빨처럼 베는 것이 아니라 커다란 창처럼 먹이를 꿰뚫습니다.수각류의 특징인 날카로운 이빨과 발톱, 잘 발달된 뒷다리, 강한 목 근육, 긴 꼬리를 가지고 있습니다.1902년에 거의 완전한 티라노사우루스의 골격 화석이 처음 발견되었으며 1.5m가 넘는 큰 머리뼈에는 강력한 턱과 8~30cm나 되는 이빨을 가지고 있었습니다.커다란 몸집을 가지고 있으면서도 잘 발달된 뒷다리와 꼬리를 이용하여 빠르게 달릴 수 있는 점을 이용하여 사냥을 하였습니다.티라노사우루스는 다른 큰 육식 동물처럼 대부분의 시간을 혼자 사냥하면서 보냈을 것입니다.티라노사우루스의 가장 큰 무기는 날카로운 이빨과 강력한 턱, 굵은 목은 어떠한 사냥감도 한번 물면 놓지 않았으며 뼈 속까지 부서질 정도의 강력한 힘을 이용하여 사냥 하였습니다.",
    "Triceratops": "각룡류 중에서 몸집이 큰 편에 속하여 육상 공룡중 머리가 가장 큰 것에 속하고 있습니다.별명은 '세 뿔 얼굴' 공룡 입니다.코 위에 작은 뿔과 양 쪽 눈 바로 위에 있는 커다란 뿔을 가지고 있으며, 머리 뒤쪽으로 목을 보호할 수 있는 넓은 프릴을 가지고 있습니다.무거운 몸집을 지탱하기 위해서 매우 튼튼한 다리를 가지고 있으며 뒷다리가 앞다리보다 잘 발달되어 있습니다.전체적으로 통통하며 곡선의 몸집을 가지고 있습니다.주둥이는 각룡류의 특징인 부리를 가지고 있습니다.미국의 화이오밍주, 몬테나주, 사우스다코타주, 콜로라도주와 캐나다의 앨버타주, 서스캐처원주에서 발견되었으며 골격 전체가 발견되지는 않았지만 많은 머리뼈 화석과 뿔, 이빨화석 등이 발견되어 각룡류 중에 가장 특이한 공룡으로 이야기 되고 있습니다.큰 몸집으로 빨리 달릴수 없는 트리케라톱스는 커다란 뿔을 가지고 있어 육식공룡에 공격에 정면으로 싸웠을 것으로 추축하고 있습니다.",
    "Velociraptor": "벨로키랍토르는 후기 백악기 (7500만 년 전 ~ 7100만 년 전)에 살았으며 몽골과 중국 지역에서 발견된 육식공룡입니다. 수각류인 벨로키랍토르는 ‘빠른 약탈자’ 이라는 의미를 가지고 있습니다. 우리가 영화에서 ‘랩터’라는 이름으로 더 잘 알려진 벨로키랍토르는 몸집은 작지만 빠른 속도와 민첩성과 무리를 지어 사냥함으로써 몸집이 더 큰 먹잇감을 사냥하였습니다.작은 몸집을 가지고 있지만 빠르게 이동할 수 신체적 조건을 가지고 있었는데, 잘 발달된 뒷다리와 강하고 긴 꼬리를 가지고 있었습니다. 긴 꼬리를 잘 지탱할 수 있었던 것은 꼬리뼈 아래 부분에 길고 납작한 뼈 막대기가 앞뒤로 붙어 있어 꼬리를 똑바로 지지해주고 있었습니다. 이러한 신체적 조건으로 빠른 속도와 날카로운 발톱을 가지고 있는 것입니다.1923년에 고비사막에서 처음 발견되었습니다. 발견된 머리뼈는 길고 날씬한 머리 형태를 하고 있었으며 긴 덕에는 날카로운 이빨을 많이 가지고 있었습니다. 날카로운 이빨들은 뒤로 휘어져 있었으며, 머리뼈에는 구멍이 많이 있었는데 이것들은 강한 턱 근육을 가진 것으로 보입니다.빠르게 달릴 수 있는 신체적 조건을 가진 벨로키랍토르는 무리를 지어 자신보다 더 큰 먹잇감을 효과적으로 공격하였으며 먹이를 꽉 물수 있는 이빨들과 일부 날카로운 발톱은 사냥의 도구로 최고의 무기였습니다. 이렇게 벨로키랍토르는 작지만 포악한 공룡 중 하나였습니다.커다란 앞발과 그 앞발에 있는 강력한 무기인 ‘낫’ 형태의 두 번째 발톱은 베어낼 수 있는 강력한 사냥무기로 사용되었습니다."
}

session = Session(profile_name="default")
polly = session.client("polly")

class PollyAI:
    def __init__(
        self
    ) -> None:
        pass

    def tts(self, dinoName) -> Dinosaurs:
        #공룡 이름 Path variable로 받기
        dino: Dinosaurs = Dinosaurs()
        #공룡 설명 불러오기
        text = dinosaurDetail[dinoName]
        
        #불러온 설명 텍스트로 Polly 서비스에 tts 신청하기
        try:
            # Request speech synthesis
            response = polly.synthesize_speech(Text=text, OutputFormat="mp3",
                                                VoiceId="Seoyeon",LanguageCode="ko-KR",Engine="neural")
        except (BotoCoreError, ClientError) as error:
            # The service returned an error, exit gracefully
            print(error)
        output="xxx"
        if "AudioStream" in response:
        # Note: Closing the stream is important because the service throttles on the
        # number of parallel connections. Here we are using contextlib.closing to
        # ensure the close method of the stream object will be called automatically
        # at the end of the with statement's scope.
            with closing(response["AudioStream"]) as stream:
                CUR_DIR=os.path.dirname(os.path.abspath(__file__))
                output = os.path.join(CUR_DIR+"\\audio_output\\", "speech.mp3")
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
        # audio output 스트림 하기.
        dino.audioSrc = output
        
        return dino
