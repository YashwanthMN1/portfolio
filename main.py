from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles

app = FastAPI()

app.mount("/imgs", StaticFiles(directory="static"), name="imgs")

@app.get("/", response_class=HTMLResponse)
async def read_resume():
    with open("index.html", "r") as f:
        return HTMLResponse(content=f.read(), status_code=200)
