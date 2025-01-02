from dotenv import load_dotenv
from pydantic_settings import BaseSettings

load_dotenv() # loads the env using the loadenv package

class Settings(BaseSettings): # pydantic pulls the value for the api key with the specific name i.e.  TAVILY_API_KEY
    TAVILY_API_KEY : str ="" # starts fetching the API key from the .env file 
