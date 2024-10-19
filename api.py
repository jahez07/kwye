from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def index():
    return {"Food":"Chicken Biriyani"}