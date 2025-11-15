how to run API locally:

powershell terminal:

# creates the environment
python -m venv .venv
.\.venv\Scripts\activate

# install dependencies
pip install -r requirements.txt

# start api
uvicorn app.main:app --reload in the terminal

# access api
Root endpoint: http://localhost:8000/
