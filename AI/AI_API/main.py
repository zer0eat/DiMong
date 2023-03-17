from fastapi import Depends, FastAPI

from configs.Environment import get_environment_variables
from metadata.Tags import Tags
# from models.BaseModel import init
from routers.v1.PictureRouter import PictureRouter


# Application Environment Configuration
env = get_environment_variables()

# Core Application Instance
app = FastAPI(
    title=env.APP_NAME,
    version=env.API_VERSION,
    openapi_tags=Tags,
)

# Add Routers
app.include_router(PictureRouter)


# Initialise Data Model Attributes
# init()
