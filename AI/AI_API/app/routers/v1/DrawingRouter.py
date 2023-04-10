from fastapi import APIRouter, Depends, File

from schemas.pydantic.DrawingSchema import (
    DrawingSchema
)

from services.DrawingService import DrawingService


DrawingRouter = APIRouter(
    prefix="/api/ai/v1/drawings", tags=["drawing"]
)


@DrawingRouter.post(path="/dinosaurs", response_model=DrawingSchema)
def getDinosaurName(image: bytes = File(), drawingService: DrawingService = Depends()):
    return drawingService.analyzeImage(image).normalize()
