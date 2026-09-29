import json
import os
from pathlib import Path

import dotenv

dotenv.load_dotenv()

BASE_URL = os.getenv("BASE_URL", "")

BASE_DIR = str(Path(__file__).resolve().parent.parent.parent).replace("\\", "/")


with open(f"{BASE_DIR}/src/data/users.json", "r") as file:
    USER_ACCOUNTS = json.load(file)
