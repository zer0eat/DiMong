from fastapi import APIRouter, Depends, File

from schemas.pydantic.DinosaursAudioSchema import (
    DinosaursAudioSchema
)

from services.DinosaursService import DinosaursService


DinosaursRouter = APIRouter(
    prefix="/api/v1/dinosaurs", tags=["dinosaurs"]
)


@DinosaursRouter.get(path="/audio/{dinoName}", response_model=DinosaursAudioSchema)
def getDinosaurDescAudio(dinoName: str, dinosaursService: DinosaursService = Depends()):
    print(dinoName)
    return dinosaursService.tts(dinoName=dinoName).normalize()
