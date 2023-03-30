from typing import Optional
from pydantic import BaseModel


# class PicturePostRequestSchema(BaseModel):
#     name: str


class PictureSchema(BaseModel):
    isFound: bool
    dinosaurName: str
