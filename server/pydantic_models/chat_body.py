from pydantic import BaseModel  

class ChatBody(BaseModel):
    query:str # this will convert any type data into string -- type validation