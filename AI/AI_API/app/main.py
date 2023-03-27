from fastapi import Depends, FastAPI

from configs.Environment import get_environment_variables
from metadata.Tags import Tags
# from models.BaseModel import init
from routers.v1.PictureRouter import PictureRouter
from routers.v1.DrawingRouter import DrawingRouter



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
app.include_router(DrawingRouter)


# Initialise Data Model Attributes
# init()
