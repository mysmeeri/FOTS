



How to run and test API locally:

## In powershell terminal:

# creates the environment
python -m venv .venv
.\.venv\Scripts\activate

# install dependencies
pip install -r API/app/requirements.txt

# start api
uvicorn app.main:app --reload in the terminal

# test in powershell (windows machines)
Invoke-RestMethod `
  -Uri http://localhost:8000/optimize `
  -Method POST `
  -ContentType "application/json" `
  -InFile .\api\test_data.json `

--> output will be presented like this:

{
  "meetingName": "Design Sync",
  "optimalSlots": {
    "2024-06-10T10:00": ["Alice", "Bob", "Carol"]
  },
  "maxParticipants": 3
}

# test in Swagger UI in browser
Root endpoint: http://localhost:8000/docs
Open the endpoint and open the /post/optimize, there you can also test by copying the test_data.json into the field
You should get similar results to the powershell test
