from typing import Optional
from pydantic import BaseModel


# class PicturePostRequestSchema(BaseModel):
#     name: str


class DrawingSchema(BaseModel):
    found: bool
    dinosaurName1: str
    dinosaurName2: str
    dinosaurName3: str

