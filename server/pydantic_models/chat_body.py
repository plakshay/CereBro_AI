from pydantic import BaseModel  

class ChatBody(BaseModel):
    query: str  # This will convert any type of data into a string with type validation
