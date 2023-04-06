from typing import List, Optional

from fastapi import Depends
from models.PictureModel import Picture

from schemas.pydantic.DinosaursAudioSchema import DinosaursAudioSchema

from ai.PollyAI import PollyAI
from models.DinosaursModel import Dinosaurs


class DinosaursService:
    PollyAI: PollyAI

    def __init__(
        self,
        PollyAI: PollyAI = Depends(),
    ) -> None:
        self.PollyAI = PollyAI

    def tts(self, dinoName) -> Dinosaurs:
        return self.PollyAI.tts(dinoName)
