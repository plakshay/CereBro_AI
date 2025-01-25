from dotenv import load_dotenv
from pydantic_settings import BaseSettings

# Load environment variables from the .env file
load_dotenv()

class Settings(BaseSettings):
    TAVILY_API_KEY: str = ""  # Fetches the API key from the .env file, defaults to an empty string if not set
