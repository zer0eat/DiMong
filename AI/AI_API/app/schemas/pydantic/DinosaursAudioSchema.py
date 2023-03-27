from typing import Optional
from pydantic import BaseModel


# class PicturePostRequestSchema(BaseModel):
#     name: str


class DinosaursAudioSchema(BaseModel):
    audioSrc: str
