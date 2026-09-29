import json
import os
from pathlib import Path


BASE_URL = os.getenv("BASE_URL", "")

USERS_JSON = os.getenv("USERS_JSON")

if USERS_JSON:
    USERS = json.loads(USERS_JSON)
else:
    PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent
    USERS_FILE = PROJECT_ROOT / "src" / "data" / "users.json"

    with USERS_FILE.open(encoding="utf-8") as file:
        USERS = json.load(file)