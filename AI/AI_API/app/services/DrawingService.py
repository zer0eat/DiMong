from typing import List, Optional

from fastapi import Depends
from models.DrawingModel import Drawing

from schemas.pydantic.DrawingSchema import DrawingSchema

from ai.DrawingAI import DrawingAI


class DrawingService:
    drawingAI: DrawingAI

    def __init__(
        self,
        drawingAI: DrawingAI = Depends(),
    ) -> None:
        self.drawingAI = drawingAI

    def analyzeImage(self, image: bytes) -> Drawing:
        return self.drawingAI.exec(image)
