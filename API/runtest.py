import json
from app.functions import findOptimalSlots

with open("API/test_data.json", "r") as f:
    data = json.load(f)
    
    
participants = data["participants"]

print(findOptimalSlots(participants), data["meetingName"])