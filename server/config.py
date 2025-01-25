from dotenv import load_dotenv
from pydantic_settings import BaseSettings

# Load environment variables from the .env file
load_dotenv()

class Settings(BaseSettings):# Fetches the API key from the .env file, defaults to an empty string if not set

    TAVILY_API_KEY: str = ""  # Default as the empty string
    GEMINI_API_KEY: str = ""
