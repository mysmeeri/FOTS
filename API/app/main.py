from fastapi import FastAPI
from .functions import findOptimalSlots

app = FastAPI()

@app.get("/")
def main():
    return findOptimalSlots()