# -*- coding: utf-8 -*-

from boto3 import Session
from botocore.exceptions import BotoCoreError, ClientError
from contextlib import closing
import os
import sys
import subprocess
from tempfile import gettempdir

# Create a client using the credentials and region defined in the [adminuser]
# section of the AWS credentials file (~/.aws/credentials).
session = Session(profile_name="default")
polly = session.client("polly")
pharase ="밸로시랩터는 이빨이 날카롭고 손톱이 길어서 사냥감을 잡을 때 사용했습니다. 그리고 이 공룡은 지능적인 동물이었습니다. 고기를 잡기 위해 다른 밸로시랩터와 함께 사냥을 했고, 소리를 내지 않고 움직이는 능력을 가지고 있어서 사냥감에게 접근하는 데 도움이 되었습니다."
try:
    # Request speech synthesis
    response = polly.synthesize_speech(Text=pharase, OutputFormat="mp3",
                                        VoiceId="Seoyeon",LanguageCode="ko-KR",Engine="neural")
except (BotoCoreError, ClientError) as error:
    # The service returned an error, exit gracefully
    print(error)
    sys.exit(-1)

# Access the audio stream from the response
if "AudioStream" in response:
    # Note: Closing the stream is important because the service throttles on the
    # number of parallel connections. Here we are using contextlib.closing to
    # ensure the close method of the stream object will be called automatically
    # at the end of the with statement's scope.
        with closing(response["AudioStream"]) as stream:
           output = os.path.join(gettempdir(), "speech.mp3")
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

# Play the audio using the platform's default player
if sys.platform == "win32":
    os.startfile(output)
else:
    # The following works on macOS and Linux. (Darwin = mac, xdg-open = linux).
    opener = "open" if sys.platform == "darwin" else "xdg-open"
    subprocess.call([opener, output])