from dotenv import load_dotenv
from pydantic_settings import BaseSettings

load_dotenv()

class Settings(BaseSettings):
    TAVILY_API_KEY: str = ""  # Default as the empty string
    GEMINI_API_KEY: str = ""