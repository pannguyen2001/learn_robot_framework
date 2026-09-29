import json
import os
from pathlib import Path

import dotenv

PROJECT_ROOT = Path(__file__).resolve().parents[2]

dotenv.load_dotenv(PROJECT_ROOT / ".env")

BASE_URL = os.getenv("BASE_URL", "")

USERS_JSON = os.getenv("USERS_JSON")

if USERS_JSON:
    USER_ACCOUNTS = json.loads(USERS_JSON)
else:
    USERS_FILE = PROJECT_ROOT / "src" / "data" / "users.json"

    with USERS_FILE.open(encoding="utf-8") as file:
        USER_ACCOUNTS = json.load(file)