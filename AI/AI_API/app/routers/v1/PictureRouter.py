from fastapi import APIRouter, Depends, File

from schemas.pydantic.PictureSchema import (
    PictureSchema
)

from services.PictureService import PictureService


PictureRouter = APIRouter(
    prefix="/api/ai/v1/pictures", tags=["picture"]
)


@PictureRouter.post(path="/dinosaurs", response_model=PictureSchema)
def getDinosaurName(image: bytes = File(), pictureService: PictureService = Depends()):
    return pictureService.analyzeImage(image).normalize()
