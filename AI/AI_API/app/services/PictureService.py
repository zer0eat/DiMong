from typing import List, Optional

from fastapi import Depends
from models.PictureModel import Picture

from schemas.pydantic.PictureSchema import PictureSchema

from ai.PictureAI import PictureAI


class PictureService:
    pictureAI: PictureAI

    def __init__(
        self,
        pictureAI: PictureAI = Depends(),
    ) -> None:
        self.pictureAI = pictureAI

    def analyzeImage(self, image: bytes) -> Picture:
        return self.pictureAI.exec(image)
