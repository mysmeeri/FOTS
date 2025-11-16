from fastapi import FastAPI
from functions import findOptimalSlots

app = FastAPI()

@app.post("/optimize")
def main(body: dict):
    participants = body["participants"]
    meetingName = body["meetingName"]

    result = findOptimalSlots(participants)

    return {
        "meetingName": meetingName,
        "optimalSlots": result["optimislotti"],
        "maxParticipants": result["maxCount"]
    }
    
@app.get("/")
def root():
    return {"message": "API is running"}


#MIKSEI TÄMÄ NÄY ADOSSA --> oLINKIN VAIN SOKEA
